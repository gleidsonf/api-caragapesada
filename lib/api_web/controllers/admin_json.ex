defmodule ApiWeb.AdminJSON do
  alias Api.Accounts.Admin

  @doc """
  Renders a list of admins.
  """
  def index(%{admins: admins}) do
    %{data: for(admin <- admins, do: data(admin))}
  end

  @doc """
  Renders a single admin.
  """
  def show(%{admin: admin}) do
    %{data: data(admin)}
  end

  defp data(%Admin{} = admin) do
    %{
      id: admin.id,
      email: admin.email,
      password_hash: admin.password_hash,
      name: admin.name
    }
  end
end
