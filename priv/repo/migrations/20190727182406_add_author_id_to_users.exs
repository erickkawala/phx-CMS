defmodule Hello.Repo.Migrations.AddAuthorIdToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :author_id, :integer
    end
    create index(:users, [:author_id])
  end
end
