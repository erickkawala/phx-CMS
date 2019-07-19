defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
  defp require_existing_author(conn, _) do
      author = CMS.ensure_author_exists(conn.assigns.current_user)
      assign(conn, :current_author, author)
  end

    defp authorize_page(conn, _) do
      page = CMS.get_page!(conn.params["id"])

      if conn.assigns.current_author.id == page.author_id do
        assign(conn, :page, page)
      else
        conn
        |> put_flash(:error, "You can't modify that page")
        |> redirect(to: Routes.cms_page_path(conn, :index))
        |> halt()
    end
end
