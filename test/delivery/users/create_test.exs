defmodule Delivery.Users.CreateTest do
  use Delivery.DataCase, async: true

  import Delivery.Factory

  alias Delivery.{Error, User}
  alias Delivery.Users.Create

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 22, email: "oi@oi.com"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{age: 15, password: "123"})
      response = Create.call(params)
      {:error, %Error{result: changeset}} = response

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
