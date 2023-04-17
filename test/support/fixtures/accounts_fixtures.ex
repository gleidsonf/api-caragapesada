defmodule Api.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Accounts` context.
  """

  @doc """
  Generate a unique admin email.
  """
  def unique_admin_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a admin.
  """
  def admin_fixture(attrs \\ %{}) do
    {:ok, admin} =
      attrs
      |> Enum.into(%{
        email: unique_admin_email(),
        name: "some name",
        password_hash: "some password_hash"
      })
      |> Api.Accounts.create_admin()

    admin
  end
end
