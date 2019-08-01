defmodule Hello.CMS.Author do
  use Ecto.Schema
  import Ecto.Changeset

  alias Hello.CMS.Page
  alias Hello.Accounts.User
  # alias Hello.CMS.Author
  # alias Hello.CMS

  schema "authors" do
    field :bio, :string
    field :genre, :string
    field :role, :string
    field :views, :integer
    field :author_id, :integer
    
    has_many :pages, Page
    belongs_to :user, User, foreign_key: :user_id

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
