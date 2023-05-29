defmodule Api.Package do
  use Ecto.Schema
  import Ecto.Changeset

  schema "packages" do
    field :description, :string
    field :height, :float
    field :length, :float
    field :nf_amount, :float
    field :nf_id, :string
    field :weight, :float
    field :width, :float
    belongs_to :client, Api.Client
    belongs_to :vehicle, Api.Vehicle
    has_one :route, Api.Route

    timestamps()
  end

  @doc false
  def changeset(package, attrs) do
    package
    |> cast(attrs, [:description, :nf_id, :nf_amount, :weight, :height, :width, :length])
    |> validate_required([:description, :nf_id, :nf_amount, :weight, :height, :width, :length])
  end
end
