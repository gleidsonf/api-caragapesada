defmodule Api.Route.History do
  use Ecto.Schema
  import Ecto.Changeset

  schema "route_history" do
    field :date, :date
    field :description, :string
    field :route_id, :id

    timestamps()
  end

  @doc false
  def changeset(history, attrs) do
    history
    |> cast(attrs, [:description, :date])
    |> validate_required([:description, :date])
  end
end
