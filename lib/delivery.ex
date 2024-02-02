defmodule Delivery do
  alias Delivery.Users.Create, as: UserCreate
  alias Delivery.Users.Delete, as: UserDelete
  alias Delivery.Users.Get, as: UserGet
  alias Delivery.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_users, to: UserGet, as: :get_all
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call
end
