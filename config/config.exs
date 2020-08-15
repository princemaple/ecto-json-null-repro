import Config

config :ecto_json, ecto_repos: [EctoJson.Repo]

import_config "#{Mix.env()}.exs"
