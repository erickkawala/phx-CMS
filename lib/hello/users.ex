defmodule Hello.Users do

  # alias Hello.Accounts.User
  alias Hello.Repo
  alias Hello.User

  def get_by_email(email), do: Repo.get_by(User, email: email)
  def get_by_name(name), do: Repo.get_by(User, name: name)
  def get_by_id(user_id), do: Repo.get_by(User, user_id: user_id)
  # def get_by_comment(user_id), do: Repo.get_by(User, comment: comment)

  
  def update_user(user, attrs) do
    user
    |> Hello.Accounts.User.changeset(attrs)
    |> Repo.update()
  end
  
end