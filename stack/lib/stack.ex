defmodule Stack do
  @moduledoc """
  GenServer Stack example.
  """

  use GenServer

  # Callbacks

  def handle_call(:pop, _from, [h | t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end

# Start server with initial :hello state
{:ok, pid} = GenServer.start_link(Stack, [:hello])

# Client pops from and pushes to the stack
GenServer.call(pid, :pop) #=> :hello
GenServer.cast(pid, {:push, :world}) #=> :ok
GenServer.call(pid, :pop) #=> :world
