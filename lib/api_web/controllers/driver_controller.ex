def create(conn, %{"driver" => driver_params}) do
  changeset = Driver.changeset(%Driver{}, driver_params)

  case Repo.insert(changeset) do
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