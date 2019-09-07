defmodule Hello.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credentials" do
    field :email, :string
    belongs_to :user, User
    field :password_digest, :string
    #todo: salt

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email])
    |> validate_required([:email])#, :password_digest
    |> unique_constraint(:email)
  end
end
