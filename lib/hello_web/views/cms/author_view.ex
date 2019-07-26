defmodule HelloWeb.CMS.AuthorView do
  use HelloWeb, :view
  alias Hello.CMS

#   TODO:  list pages by author
  def list_pages(%CMS.Page{author: pages}) do
    # author.user.pages ?????
  end
end