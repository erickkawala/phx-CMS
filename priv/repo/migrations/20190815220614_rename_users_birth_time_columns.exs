defmodule Hello.Repo.Migrations.RenameUsersBirthTimeColumns do
  use Ecto.Migration

  def change do
    rename table(:users), :birthday_year, to: :birth_year
    rename table(:users), :birthday_month, to: :birth_month
    rename table(:users), :birthday_day, to: :birth_day
  end
end
