# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :nlw_heat_elixir,
  ecto_repos: [NlwHeatElixir.Repo]

# Configures the endpoint
config :nlw_heat_elixir, NlwHeatElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PO0oCFdhRqi5zi/cnWkhEtBWFB+2G/K1KTyYrxbXEEdv23dz5wFHFaUrozhSoqHS",
  render_errors: [view: NlwHeatElixirWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: NlwHeatElixir.PubSub,
  live_view: [signing_salt: "hx1YuVlg"]

config :nlw_heat_elixir, NlwHeatElixir.Scheduler, jobs: [
  {~e["0 0 * * *"], {NlwHeatElixir.Tags.Count, :send, []}}
]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
