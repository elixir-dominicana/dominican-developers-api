# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :dominican_developers_api,
  ecto_repos: [DominicanDevelopersApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :dominican_developers_api, DominicanDevelopersApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: DominicanDevelopersApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DominicanDevelopersApi.PubSub,
  live_view: [signing_salt: "n6eC/MiQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Data for load
config :initial_data_app, :initial_data, developers: System.get_env("DEVELOPERS_JSON_DATA")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
