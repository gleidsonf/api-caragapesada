defmodule Api.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :address, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :email, :address])
    |> validate_required([:name, :email, :address])
  end
end
