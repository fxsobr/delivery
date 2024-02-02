defmodule Delivery.Users.Get do
  alias Delivery.{Error, Repo, User}

  def get_all do
    Repo.all(User)
  end

  def get(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
