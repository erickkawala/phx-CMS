defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser
    
    resources "/sessions", SessionController, only: [:new, :create, :delete],
                                              singleton: true
    
    get "/", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/users", UserController, only: [:new, :create, :index]
  end

  scope "/", HelloWeb do
    pipe_through [:browser, :authenticate_user]
    resources "/users", UserController, only: [:show, :delete]
  end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Hello.Accounts.get_user!(user_id))
    end
  end

  scope "/cms", HelloWeb.CMS, as: :cms do
      pipe_through [:browser, :authenticate_user]
      resources "/pages", PageController
      resources "/authors", AuthorController
  end
  defmodule NoRouteError do
    @moduledoc """
    Exception raised when no route is found.
    """
    defexception plug_status: 404, message: "no route found", conn: nil, router: nil

    def exception(opts) do
      conn   = Keyword.fetch!(opts, :conn)
      router = Keyword.fetch!(opts, :router)
      path   = "/" <> Enum.join(conn.path_info, "/")

      %NoRouteError{message: "no route found for #{conn.method} #{path} (#{inspect router})",
      conn: conn, router: router}
    end
  end
  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end
end
