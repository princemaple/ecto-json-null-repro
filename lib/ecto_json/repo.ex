defmodule EctoJson.Repo do
  use Ecto.Repo,
    otp_app: :ecto_json,
    adapter: Ecto.Adapters.Postgres
end
