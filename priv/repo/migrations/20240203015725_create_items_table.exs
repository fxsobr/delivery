defmodule Delivery.Repo.Migrations.CreateItemsTable do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :description, :string
      add :price, :decimal
      add :photo, :string
      add :category, :item_category
      timestamps()
    end
  end
end
