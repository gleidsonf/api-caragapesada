defmodule Api.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :license_plate, :string
      add :consumption, :float
      add :capacity, :float
      add :model, :string

      timestamps()
    end
  end
end
