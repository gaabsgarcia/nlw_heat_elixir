defmodule NlwHeatElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      NlwHeatElixir.Repo,
      # Start the Telemetry supervisor
      NlwHeatElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: NlwHeatElixir.PubSub},
      # Start the Endpoint (http/https)
      NlwHeatElixirWeb.Endpoint,
      # Start a worker by calling: NlwHeatElixir.Worker.start_link(arg)
      # {NlwHeatElixir.Worker, arg}
      NlwHeatElixir.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NlwHeatElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    NlwHeatElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
