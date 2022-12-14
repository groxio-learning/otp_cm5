defmodule Perplexer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias Perplexer.Server

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Perplexer.Worker.start_link(arg)
      {Server, "0"}

    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Perplexer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

