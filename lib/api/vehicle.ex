defmodule Api.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vehicles" do
    field :capacity, :float
    field :consumption, :float
    field :license_plate, :string
    field :model, :string
    belongs_to :driver, Api.Driver, foreign_key: :driver_id

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:license_plate, :consumption, :capacity, :model])
    |> validate_required([:license_plate, :consumption, :capacity, :model])
  end
end
