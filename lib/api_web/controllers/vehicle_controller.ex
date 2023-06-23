defmodule ApiWeb.VehicleController do
  use ApiWeb, :controller

  def create(conn, %{"vehicle" => vehicle_params}) do
    changeset = Api.Vehicle.changeset(%Api.Vehicle{}, vehicle_params)

    case Api.Repo.insert(changeset) do
      {:ok, vehicle} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.vehicle_path(conn, :show, vehicle))
        |> json(%{data: vehicle})
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: changeset.errors})
    end
  end

  def show(conn, %{"id" => id}) do
    vehicle = Api.Repo.get(Api.Vehicle, id)

    case vehicle do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Vehicle not found"})
      _ ->
        conn
        |> put_status(:ok)
        |> json(%{data: vehicle})
    end
  end

  def update(conn, %{"id" => id, "vehicle" => vehicle_params}) do
    vehicle = Api.Repo.get(Api.Vehicle, id)

    case vehicle do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Vehicle not found"})
      _ ->
        changeset = Api.Vehicle.changeset(vehicle, vehicle_params)

        case Api.Repo.update(changeset) do
          {:ok, updated_vehicle} ->
            conn
            |> put_status(:ok)
            |> json(%{data: updated_vehicle})
          {:error, changeset} ->
            conn
            |> put_status(:unprocessable_entity)
            |> json(%{errors: changeset.errors})
        end
    end
  end

  def delete(conn, %{"id" => id}) do
    vehicle = Api.Repo.get(Api.Vehicle, id)

    case vehicle do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Vehicle not found"})
      _ ->
        Api.Repo.delete(vehicle)

        conn
        |> put_status(:no_content)
        |> send_resp()
    end
  end

  def index(conn, _params) do
    vehicles = Api.Repo.all(Api.Vehicle)

    conn
    |> put_status(:ok)
    |> json(%{data: vehicles})
  end
end