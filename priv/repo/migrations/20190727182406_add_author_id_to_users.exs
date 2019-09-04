defmodule Hello.Repo.Migrations.AddAuthorIdToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :author_id, :integer
      #add :author_id, references(:authors, on_delete: :delete_all),
                      # null: false
    end
    create index(:users, [:author_id])
  end
end
