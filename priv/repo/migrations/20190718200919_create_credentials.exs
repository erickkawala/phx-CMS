defmodule Hello.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add :email, :string
      add :user_id, references(:users, on_delete: :delete_all),
                  null: false
      add :password_digest, :string
      timestamps()
    end

    create unique_index(:credentials, [:email])
    create index(:credentials, [:user_id])
  end
end
