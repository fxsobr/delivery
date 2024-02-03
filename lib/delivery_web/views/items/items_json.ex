defmodule DeliveryWeb.ItemsJSON do
  alias Delivery.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created successfully",
      item: item
    }
  end
end
