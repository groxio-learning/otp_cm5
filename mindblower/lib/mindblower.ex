defmodule Mindblower.Score do
  
  defstruct [:reds, :whites]
  
  # Constructor

  def new(answer, guess) do
    len = length(guess)
    reds = Enum.zip(answer, guess) |> Enum.filter(fn {x, y} -> x == y end) |> length
    empty = length(guess -- answer)
    whites = len - (reds + empty)
    __struct__(reds: reds, whites: whites)
  end

  # Converter

  def show(score) do
    String.duplicate("R", score.reds) <> String.duplicate("W", score.whites)
  end

  # Helper using Constructor and Converter

  def calculate(answer, guess) do
    answer |> new(guess) |> show()
  end

end
