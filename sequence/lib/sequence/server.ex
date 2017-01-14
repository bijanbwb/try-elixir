defmodule Sequence.Server do
  @moduledoc """
  GenServer Sequence example from Programming Elixir.

  ## Example Usage

  iex> Sequence.Server.start_link(100)
  iex> Sequence.Server.next_number()
  100
  iex> Sequence.Server.next_number()
  101
  iex> Sequence.Server.increment_number(50)
  :ok
  iex> Sequence.Server.next_number()
  152
  """

  use GenServer

  # External API

  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  def next_number() do
    GenServer.call(__MODULE__, :next_number)
  end

  def increment_number(delta) do
    GenServer.cast(__MODULE__, {:increment_number, delta})
  end

  # Callbacks

  @doc """
  Replies with the next number in the sequence.

  ## Example Usage

  iex> {:ok, pid} = GenServer.start_link(Sequence.Server, 100)
  iex> GenServer.call(pid, :next_number)
  100
  iex> GenServer.call(pid, :next_number)
  101
  iex> GenServer.call(pid, :next_number)
  102
  """
  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end

  @doc """
  Increment the current state with a number.

  ## Example Usage

  iex> {:ok, pid} = GenServer.start_link(Sequence.Server, 100)
  iex> GenServer.call(pid, :next_number)
  100
  iex> GenServer.cast(pid, {:increment_number, 200})
  :ok
  iex> GenServer.call(pid, :next_number)
  301
  """
  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, current_number + delta}
  end
end
