defmodule Api.Repo.Migrations.CreatePackages do
  use Ecto.Migration

  def change do
    create table(:packages) do
      add :description, :text
      add :nf_id, :string
      add :nf_amount, :float
      add :weight, :float
      add :height, :float
      add :width, :float
      add :length, :float
      add :client_id, references(:clients)
      add :vehicle_id, references(:vehicles), null: true

      timestamps()
    end
  end
end
