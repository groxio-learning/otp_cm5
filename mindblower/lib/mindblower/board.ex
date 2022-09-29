defmodule Mindblower.Board do

  alias Mindblower.Score

  defstruct [ turns: [],answer: [1,2,3,4]]

  def new() do
     __MODULE__.__struct__(answer: random_answer())
  end

  def take_turn(board,list) do
    %{board | turns: [list | board.turns]}
  end

  def show(board) do
    """
    #{rows(board)}
    --------------
    #{check_status(board)}
    """
  end

  def rows(board) do
    board.turns
    |> Enum.map(&row(board.answer, &1))
  end

  defp row(answer, guess) do
    "#{Enum.join(guess, " ")} | #{Score.calculate(answer, guess)}"
  end

  def check_status(%{answer: answer, turns: [answer | _]}) do
    :won
  end

  def check_status(%{turns: turns}) when length(turns) >= 10 do
    :lost
  end

  def check_status(_board) do
    :playing
  end

  defp random_answer() do
    1..8 |> Enum.shuffle |> Enum.take(4)
  end
  
end
