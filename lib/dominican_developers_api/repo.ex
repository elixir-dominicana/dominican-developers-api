defmodule DominicanDevelopersApi.Repo do
  use Ecto.Repo,
    otp_app: :dominican_developers_api,
    adapter: Ecto.Adapters.Postgres
end
