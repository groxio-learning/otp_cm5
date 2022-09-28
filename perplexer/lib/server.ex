defmodule Perplexer.Server do
    use GenServer
    alias Perplexer.Countarr

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

