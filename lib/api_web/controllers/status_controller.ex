defmodule ApiWeb.StatusController do
  use ApiWeb, :controller

  def status(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{status: "Hello!", date: DateTime.utc_now})
  end
end
