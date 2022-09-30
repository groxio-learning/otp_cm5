defmodule Mindblower.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Mindblower.Worker.start_link(arg)
      # {Mindblower.Worker, arg}
      #{Mindblower.Server, :iron_man},
      #{Mindblower.Server, :superman},
      #{Mindblower.Server, :wonder_woman},
      #{Mindblower.Server, :groot},
      #{Mindblower.Server, :thor}
      {DynamicSupervisor, strategy: :one_for_one, name: :dsup}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Lifecycle]
    Supervisor.start_link(children, opts)
  end
end
