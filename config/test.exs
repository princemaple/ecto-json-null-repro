import Config

config :ecto_json, EctoJson.Repo,
  username: "postgres",
  password: "password",
  database: "test",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox
