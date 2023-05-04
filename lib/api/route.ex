defmodule Api.Route do
  use Ecto.Schema
  import Ecto.Changeset

  schema "routes" do
    field :date, :utc_datetime
    field :destinationAddress, :string
    field :destinationCep, :string
    field :destinationLocation, :string
    field :startLocation, :string
    field :status, :integer
    belongs_to :package, Api.Package

    timestamps()
  end

  @doc false
  def changeset(route, attrs) do
    route
    |> cast(attrs, [:status, :startLocation, :destinationLocation, :date, :destinationAddress, :destinationCep])
    |> validate_required([:status, :startLocation, :destinationLocation, :date, :destinationAddress, :destinationCep])
  end
end
