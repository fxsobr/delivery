defmodule DeliveryWeb.UsersController do
  use DeliveryWeb, :controller

  alias Delivery.User
  alias DeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Delivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def index(conn, _params) do
    users = Delivery.get_users()

    conn
    |> put_status(:ok)
    |> render("index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Delivery.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Delivery.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Delivery.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
