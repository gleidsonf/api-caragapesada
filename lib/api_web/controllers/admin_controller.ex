defmodule ApiWeb.AdminController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.Admin
  alias Api.Guardian

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    admins = Accounts.list_admins()
    render(conn, :index, admins: admins)
  end

  def create(conn, %{"admin" => admin_params}) do
    with {:ok, %Admin{} = admin} <- Accounts.create_admin(admin_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(admin) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/v1/admins/#{admin}")
      # |> render(:show, admin: admin)
      |> render('jwt.json', jwt: token)
    end
  end

  def show(conn, %{"id" => id}) do
    admin = Accounts.get_admin!(id)
    render(conn, :show, admin: admin)
  end
end
