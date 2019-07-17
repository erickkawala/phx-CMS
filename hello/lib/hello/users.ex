defmodule Hello.Users do

  alias Hello.Repo
  alias Hello.User

  def get_by_email(email), do: Repo.get_by(User, email: email)
  def get_by_name(name), do: Repo.get_by(User, name: name)
  def get_by_id(user_id), do: Repo.get_by(User, user_id: user_id)
  
  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end
end