defmodule Clustlixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Cluster.Supervisor, [topologies(), [name: Clustlixir.ClusterSupervisor]]},
      # Starts a worker by calling: Clustlixir.Worker.start_link(arg)
      # {Clustlixir.Worker, arg}
      Clustlixir.Observer,
      Clustlixir.Ping
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Clustlixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp topologies do
    [
      clustlixir: [
        strategy: Cluster.Strategy.Epmd,
        config: [
          hosts: [
            :"n1@127.0.0.1",
            :"n2@127.0.0.1"
          ]
        ]
      ]
    ]
  end
end
