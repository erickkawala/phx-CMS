defmodule Hello.CMS.Author do
  use Ecto.Schema
  import Ecto.Changeset

  alias Hello.CMS.Page
  # alias Hello.CMS.Author
  # alias Hello.CMS

  schema "authors" do
    field :bio, :string
    field :genre, :string
    field :role, :string
    field :views, :integer
    
    has_many :pages, Page
    belongs_to :user, Hello.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:bio, :role, :genre])
    |> validate_required([:bio, :role, :genre])
    |> unique_constraint(:user_id)
  end
end
