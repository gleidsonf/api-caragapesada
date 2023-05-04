defmodule Api.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :name, :string
      add :email, :string
      add :password, :string
      add :picture, :string, null: true

      timestamps()
    end
  end
end
