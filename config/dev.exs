import Config

config :ecto_json, EctoJson.Repo,
  username: "postgres",
  password: "password",
  database: "dev",
  hostname: "db",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
