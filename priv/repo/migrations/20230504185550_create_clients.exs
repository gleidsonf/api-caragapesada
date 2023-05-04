defmodule Api.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :email, :string
      add :address, :text

      timestamps()
    end
  end
end
