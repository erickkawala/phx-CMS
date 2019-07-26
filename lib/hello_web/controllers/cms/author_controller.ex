defmodule HelloWeb.CMS.AuthorController do
  use HelloWeb, :controller
  
alias Hello.CMS
alias Hello.CMS.Author
alias Hello.CMS.Page

  def index(conn, _params) do
    authors = CMS.list_authors()
    render(conn, "index.html", authors: authors)
  end

  def new(conn, _params) do
    changeset = CMS.change_author(%Author{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"author" => author_params}) do
    case CMS.create_author(author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author created successfully.")
        |> redirect(to: Routes.cms_author_path(conn, :show, author))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    author =
      id
      |> CMS.get_author!()
      # |> CMS.inc_author_views()

    render(conn, "show.html", author: author)
  end

  def edit(conn) do
    # need author.user_id here
    changeset = CMS.change_author(conn.assigns.author)
    render(conn, "edit.html", changeset: changeset)
  end

  def update(conn, %{"author" => author_params}) do
    case CMS.update_author(conn.assigns.author, author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author updated successfully.")
        |> redirect(to: Routes.cms_author_path(conn, :show, author))
      {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete(conn, _) do
    {:ok, _author} = CMS.delete_author(conn.assigns.author)

    conn
    |> put_flash(:info, "Author deleted successfully.")
    |> redirect(to: Routes.cms_author_path(conn, :index))
  end

end