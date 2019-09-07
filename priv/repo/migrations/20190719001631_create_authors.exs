defmodule Hello.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :bio, :text
      add :role, :string
      add :genre, :string
      add :views, :integer, default: 0
      add :user_id, references(:users, on_delete: :delete_all),
                      null: false
      add :pen_name, :string
      timestamps()
    end

    create unique_index(:authors, [:user_id])
  end
end
