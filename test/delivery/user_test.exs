defmodule Delivery.UserTest do
  use Delivery.DataCase, async: true

  alias Ecto.Changeset
  alias Delivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        age: 27,
        address: "Rua das Flores, 123",
        cep: "12345678",
        cpf: "12345678901",
        email: "oi@oi.com",
        password: "123456",
        name: "Padmé Amidala"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{}, data: %User{}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changest with the given changeset" do
      params = %{
        age: 27,
        address: "Rua das Flores, 123",
        cep: "12345678",
        cpf: "12345678901",
        email: "oi@oi.com",
        password: "123456",
        name: "Padmé Amidala"
      }

      update_params = %{name: "Anakin Skywalker", password: "654321"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Anakin Skywalker", password: "654321"}, valid?: true} =
               response
    end

    test "when there are some error, returns a invalid changeset" do
      params = %{
        age: 12,
        address: "Rua das Flores, 123",
        cep: "12345678",
        cpf: "12345678901",
        email: "oi@oi.com",
        password: "123",
        name: "Padmé Amidala"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
