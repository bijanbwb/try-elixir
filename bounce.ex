defmodule Bounce do
  @moduledoc """
  Bounce messages with report function.
  """
  @vsn 0.1

  @doc """
  Recursively uses `report()` function to receive and print messages.

  ## Usage

  ```elixir
  pid = spawn(Bounce, :report, [])
  send(pid, :hello)
  # => Received :hello
  # => :hello
  ```
  """
  @spec report() :: atom()
  def report do
    receive do
      msg -> IO.puts("Received #{msg}")
      report()
    end
  end
end

