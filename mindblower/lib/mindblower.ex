defmodule Mindblower do
  alias Mindblower.Server

  def take_turn(name, guess) do
    Server.take_turn(name, guess)
  end
end
