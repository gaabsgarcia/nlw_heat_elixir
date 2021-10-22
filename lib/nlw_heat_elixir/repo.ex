defmodule NlwHeatElixir.Repo do
  use Ecto.Repo,
    otp_app: :nlw_heat_elixir,
    adapter: Ecto.Adapters.Postgres
end
