defmodule Mindblower.Server do
  
  use GenServer
  
  alias Mindblower.Board

  # Server (callbacks)

  @impl true
  def init(_new_game) do
      {:ok, Board.new()}
  end

  @impl true
  def handle_call(:guess, _from, board) do
      {:reply, Board.show(board), board}
  end

  @impl true
  def handle_cast({:take_turn, guess}, board) do
    {:noreply, Board.take_turn(board, guess)}
  end

end