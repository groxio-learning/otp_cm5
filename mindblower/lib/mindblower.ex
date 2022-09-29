defmodule Mindblower.Score do
  
  def calculate_score(answer, guess) do
    len = length(guess)
    reds = Enum.zip(answer, guess) |> Enum.filter(fn {x, y} -> x == y end) |> length
    empty = length(guess -- answer)
    whites = len - (reds + empty)
    String.duplicate("R", reds) <> String.duplicate("W", whites) 
  end

end
