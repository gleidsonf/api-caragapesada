defmodule Api.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :picture, :string

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:name, :email, :password, :picture])
    |> validate_required([:name, :email, :password])
  end
end
