defmodule Hello.Repo.Migrations.AddPasswordHashToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :pasword_hash, :string, length: 64
    end
  end
end
