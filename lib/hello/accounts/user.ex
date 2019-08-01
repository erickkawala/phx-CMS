defmodule Hello.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Hello.Accounts.Credential
  alias Hello.CMS.Author

  schema "users" do
    field :name, :string
    field :username, :string
    field :birth_year, :integer
    field :birth_month, :integer
    field :birth_day, :integer
    has_one :credential, Credential
    has_one :author, Author, foreign_key: :author_id
    timestamps()
  end

  @doc false
  # ^^ means not available to the public API
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> unique_constraint(:username)
  end
end

#   def changeset(user, params \\ %{}) do
#     user
#     |> cast(params, [:name, :email, :password_hash])
#     |> validate_required([:name, :email])
#     |> validate_format(:email, ~r/@/)
#     |> validate_inclusion(:age, 18..100)
#     |> unique_constraint(:email)
#   end
# end