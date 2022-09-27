defmodule CountarrTest do
  use ExUnit.Case

  test "crc" do
    actual = "42" |> Perplexer.Countarr.new() |> Perplexer.Countarr.inc(10)

    expected = 52

    assert actual == expected
  end
end
