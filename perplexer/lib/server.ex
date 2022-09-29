defmodule Perplexer.Server do
    use GenServer
    alias Perplexer.Countarr

    # Client

    def start_link(input) do
      GenServer.start_link(__MODULE__, input, name: :counter)
    end

    def inc(counter_pid \\ :counter) do
      GenServer.cast(counter_pid, :inc)
    end

    def dec(counter_pid \\ :counter) do
      GenServer.cast(counter_pid, :dec)
    end

    def show(counter_pid \\ :counter) do
      GenServer.call(counter_pid, :show)
    end

    # Server (callbacks)

    @impl true
    def init(input) do
        {:ok, Countarr.new(input)}
    end

    @impl true
    def handle_cast(:inc, counter) do
        {:noreply, Countarr.inc(counter)}
    end

    @impl true
    def handle_cast(:dec, counter) do
        {:noreply, Countarr.dec(counter)}
    end

    @impl true
    def handle_call(:show, _from, counter) do
        {:reply, Countarr.show(counter), counter}
    end
end

#{:ok, pid} = GenServer.start_link(Perplexer.Server, "42") 
#GenServer.cast(pid, :inc)
#GenServer.call(pid, :show)

