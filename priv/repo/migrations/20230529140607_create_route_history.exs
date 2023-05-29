defmodule Api.Repo.Migrations.CreateRouteHistory do
  use Ecto.Migration

  def change do
    create table(:route_history) do
      add :description, :string
      add :date, :date
      add :route_id, references(:routes, on_delete: :nothing)

      timestamps()
    end

    create index(:route_history, [:route_id])
  end
end
