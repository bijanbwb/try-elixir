defmodule Stack do
  @moduledoc """
  GenServer Stack example.
  """

  use GenServer

  # Client

  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def push(pid, item) do
    GenServer.cast(pid, {:push, item})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (Callbacks)

  def handle_call(:pop, _from, [h | t]) do
    {:reply, h, t}
  end

  def handle_call(request, from, state) do
    # Call the default implementation from GenServer
    super(request, from, state)
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end

  def handle_cast(request, state) do
    super(request, state)
  end
end

# Start GenServer with initial state
{:ok, pid} = Stack.start_link([:one])

# Client pops from and pushes to the stack
Stack.push(pid, :two) #=> :ok
Stack.push(pid, :three) #=> :ok
Stack.pop(pid) #=> :three
Stack.pop(pid) #=> :two
Stack.pop(pid) #=> :one

