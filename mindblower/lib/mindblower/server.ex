defmodule Mindblower.Server do
  use GenServer

  alias Mindblower.Board

  # Client (API)

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  def take_turn(server, guess) do
    GenServer.call(server, {:take_turn, guess}) |> IO.puts()
  end

  # Server (callbacks)

  @impl true
  def init(name) do
    IO.puts("Starting #{name}")
    {:ok, Board.new()}
  end

  @impl true
  def handle_call({:take_turn, guess}, _from, board) do
    new_board = Board.take_turn(board, guess)
    {:reply, Board.show(new_board), new_board}
  end

  def child_spec(name) do
    %{id: name, start: {Mindblower.Server, :start_link, [name]}}
  end
end
