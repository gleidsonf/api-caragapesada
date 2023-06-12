defmodule ApiWeb.DriverController do
  use ApiWeb, :controller

  def create(conn, %{"driver" => driver_params}) do
    changeset = Api.Driver.changeset(%Api.Driver{}, driver_params)

    case Api.Repo.insert(changeset) do
      {:ok, driver} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.driver_path(conn, :show, driver))
        |> json(%{data: driver})
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: changeset.errors})
    end
  end

  def show(conn, %{"id" => id}) do
    driver = Api.Repo.get(Api.Driver, id)

    case driver do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Driver not found"})
      _ ->
        conn
        |> put_status(:ok)
        |> json(%{data: driver})
    end
  end

  def update(conn, %{"id" => id, "driver" => driver_params}) do
    driver = Api.Repo.get(Api.Driver, id)

    case driver do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Driver not found"})
      _ ->
        changeset = Api.Driver.changeset(driver, driver_params)

        case Api.Repo.update(changeset) do
          {:ok, updated_driver} ->
            conn
            |> put_status(:ok)
            |> json(%{data: updated_driver})
          {:error, changeset} ->
            conn
            |> put_status(:unprocessable_entity)
            |> json(%{errors: changeset.errors})
        end
    end
  end

  def delete(conn, %{"id" => id}) do
    driver = Api.Repo.get(Api.Driver, id)

    case driver do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Driver not found"})
      _ ->
        Api.Repo.delete(driver)

        conn
        |> put_status(:no_content)
        |> send_resp()
    end
  end

  def index(conn, _params) do
    drivers = Api.Repo.all(Api.Driver)

    conn
    |> put_status(:ok)
    |> json(%{data: drivers})
  end
end