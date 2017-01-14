defmodule Sequence.Server do
  use GenServer

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
end
