defmodule Delivery.UserTest do
  use Delivery.DataCase, async: true

  import Delivery.Factory

  alias Ecto.Changeset
  alias Delivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{}, data: %User{}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changest with the given changeset" do
      params = build(:user_params)

      update_params = %{name: "Anakin Skywalker", password: "654321"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Anakin Skywalker", password: "654321"}, valid?: true} =
               response
    end

    test "when there are some error, returns a invalid changeset" do
      params = build(:user_params, %{age: 15, password: "123"})

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
