defmodule Delivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 22,
      address: "Rua das Flores, 123",
      cep: "12345678",
      cpf: "12345678901",
      email: "oi@oi.com",
      password: "123456",
      name: "Padmé Amidala"
    }
  end
end
