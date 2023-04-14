defmodule Api.Guardian do
  use Guardian, opt_app: :api

  def subject_for_token(admin, _claims) do
    sub = to_string(admin.id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Api.Accounts.get_admin!(id)
    {:ok, resource}
  end

  def resource_from_claims(_) do
    {:error, :reason_for_error}
  end
end
