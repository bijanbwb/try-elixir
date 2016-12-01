defmodule Messages do
  @moduledoc """
  Simple example to demonstrate how to spawn a process that
  continually runs (the `listen` function calls itself and receives
  messages.

  ## Usage

      pid = spawn(Messages, :listen, [])
      send pid, {:ok, "hello"}
  """

  def listen do
    receive do
      {:ok, "hello"} -> IO.puts "Message received..."
    end

    listen
  end
end

