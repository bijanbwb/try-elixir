defmodule SimpleQueue do
  use GenServer

  @moduledoc """
  GenServer Example from Elixir School:
  http://elixirschool.com/lessons/advanced/otp-concurrency/#genserver
  
  ## Usage

  iex> SimpleQueue.start_link([1, 2, 3])
  {:ok, #PID<0.100.0>}
  iex> SimpleQueue.queue
  [1, 2, 3]
  iex> SimpleQueue.enqueue(20)
  :ok
  iex> SimpleQueue.queue
  [1, 2, 3, 20]
  """

  ### GenServer API

  @doc """
  GenServer.init/1 callback
  """
  def init(state), do: {:ok, state}

  @doc """
  GenServer.handle_call/3 callback
  """
  def handle_call(:dequeue, _from, [value|state]) do
    {:reply, value, state}
  end
  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}

  def handle_call(:queue, _from, state), do: {:reply, state, state}

  @doc """
  GenServer.handle_cast/2 callback
  """
  def handle_cast({:enqueue, value}, state) do
    {:noreply, state ++ [value]}
  end

  ### Client API / Helper methods

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
  def queue, do: GenServer.call(__MODULE__, :queue)
  def enqueue(value), do: GenServer.cast(__MODULE__, {:enqueue, value})
  def dequeue, do: GenServer.call(__MODULE__, :dequeue)
end

