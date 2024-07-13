defmodule Financess.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FinancessWeb.Telemetry,
      Financess.Repo,
      {DNSCluster, query: Application.get_env(:financess, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Financess.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Financess.Finch},
      # Start a worker by calling: Financess.Worker.start_link(arg)
      # {Financess.Worker, arg},
      # Start to serve requests, typically the last entry
      FinancessWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Financess.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FinancessWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
