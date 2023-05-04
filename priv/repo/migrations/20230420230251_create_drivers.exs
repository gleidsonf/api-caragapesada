defmodule Api.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :name, :string
      add :email, :string
      add :password, :string
      add :picture, :string

      timestamps()
    end
  end
end
