defmodule Hello.Users do

  # alias Hello.Accounts.User
  alias Hello.Repo
  alias Hello.User

  def get_by_email(email), do: Repo.get_by(User, email: email)
  def get_by_name(name), do: Repo.get_by(User, name: name)
  def get_by_id(user_id), do: Repo.get_by(User, user_id: user_id)
  def get_by_author(author_id), do: Repo.get_by(User, author_id: author_id)

  

  # def get_by_comment(user_id), do: Repo.get_by(User, comment: comment)
  # query = from u in "users", where: u.age > 0, select: u.name

  def get_by_birthday_year(birthday_year), do: Repo.get_by(User, birthday_year: birthday_year)
  # birthday_year buckets 1..N
  def get_by_birthday_month(birthday_month), do: Repo.get_by(User, birthday_month: birthday_month)
  
  def get_by_birthday_day(birthday_day), do: Repo.get_by(User, birthday_day: birthday_day)

  def get_by_region(region), do: Repo.get_by(User, region: region)
  def get_by_subregion(subregion), do: Repo.get_by(User, subregion: subregion)
  def get_by_city(city), do: Repo.get_by(User, city: city)
  
  def update_user(user, attrs) do
    user
    |> Hello.Accounts.User.changeset(attrs)
    |> Repo.update()
  end
  
end