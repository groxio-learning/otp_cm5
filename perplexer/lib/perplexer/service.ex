defmodule Perplexer.Service do

  alias Perplexer.Countarr 

  # client

  def start(input) do
    spawn(
      fn ->
        input
        |> Countarr.new()
        |> loop()
      end
    )
  end

  def inc(server_pid) do
    send(server_pid, :inc)
  end

  def dec(server_pid) do
    send(server_pid, :dec)
  end

  def show(server_pid) do
    send(server_pid, {:show, self()})
    receive do
      m -> m
    end
  end

  # server

  def loop(counter) do
    counter
    |> listen()
    |> loop()
  end

  def listen(counter) do
    receive do
      :inc ->
        Countarr.inc(counter)
      :dec ->
        Countarr.dec(counter)
      {:show, client} -> 
        send client, Countarr.show(counter)
        counter
    end
  end
end