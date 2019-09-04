# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:

# defmodule <%= Hello %>.DatabaseSeeder do
#   alias <%= Hello %>
#   alias <%= Hello %>.Accounts.User
#   alias <%= Hello %>.Repo
alias Hello
alias Hello.Accounts.User
alias Hello.Repo

defmodule Hello.DatabaseSeeder do
  def insert_loop(n) do
    if n == 10 do
      exit(:shutdown)
    else
      Hello.Repo.insert!(%User{name: "name#{n}",username: "username#{n}"})
      insert_loop(n+1)
    end
  end
end
Hello.DatabaseSeeder.insert_loop(2)

# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

#  https://phoenixframework.org/blog/seeding-data

# cities and subregions list:
# https://datahub.io/core/world-cities

# countries list: https://gist.github.com/kalinchernev/486393efcca01623b18d
#

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     OneDayForTheHomeless.Repo.insert!(%OneDayForTheHomeless.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
