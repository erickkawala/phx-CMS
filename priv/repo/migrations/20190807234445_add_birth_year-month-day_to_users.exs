defmodule :"Elixir.Hello.Repo.Migrations.AddBirthYear-month-dayToUsers" do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :birth_year, :integer, min: 1900, max: 2019
      add :birth_month, :integer, min: 1, max: 12
      add :birth_day, :integer, min: 0, max: 31
    end
  end
end
