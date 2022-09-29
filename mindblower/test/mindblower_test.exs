defmodule MindblowerTest do
  use ExUnit.Case
  doctest Mindblower

  test "greets the world" do
    assert Mindblower.hello() == :world
  end
end
