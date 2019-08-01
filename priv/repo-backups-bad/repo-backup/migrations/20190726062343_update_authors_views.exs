defmodule Hello.Repo.Migrations.UpdateAuthorsViews do
  use Ecto.Migration

  def change do
    alter table(:authors) do
      add :views, :integer, default: 0
    end
  end
end
