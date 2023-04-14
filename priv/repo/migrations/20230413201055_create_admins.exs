defmodule Api.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :email, :string
      add :password_hash, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:admins, [:email])
  end
end
