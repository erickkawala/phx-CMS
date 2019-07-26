defmodule HelloWeb.CMS.AuthorController do
  use HelloWeb, :controller
  

alias Hello.CMS.Author
alias Hello.CMS.Page

  def index(conn, _params) do
    pages = CMS.list_authors()
    render(conn, "index.html", authors: authors)
  end

end