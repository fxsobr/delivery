defmodule DeliveryWeb.UsersJSON do
  alias Delivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created successfully",
      user: user
    }
  end

  def render("show.json", %{user: %User{} = user}) do
    %{
      user: user
    }
  end
end
