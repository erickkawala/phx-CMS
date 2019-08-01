defmodule Hello.Repo.Migrations.AddRegionSubregionCityToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :region, :string, length: 63
      add :subregion, :string, length: 37
      add :city, :string, length: 38
    end
  end
end
