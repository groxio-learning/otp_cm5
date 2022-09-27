defmodule PerplexerTest do
  use ExUnit.Case
  doctest Perplexer

  test "greets the world" do
    assert Perplexer.hello() == :world
  end
end
