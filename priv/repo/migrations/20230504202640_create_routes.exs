defmodule Api.Repo.Migrations.CreateRoutes do
  use Ecto.Migration

  def change do
    create table(:routes) do
      add :status, :integer
      add :startLocation, :string
      add :destinationLocation, :string
      add :date, :utc_datetime
      add :destinationAddress, :string
      add :destinationCep, :string
      add :package_id, references(:packages)

      timestamps()
    end
  end
end
