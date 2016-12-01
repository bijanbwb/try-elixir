defmodule Example do
  def listen do
    receive do
      {:ok, "hello"} -> IO.puts "Message received..."
    end

    listen
  end
end

# pid = spawn(Example, :listen, [])
# send pid, {:ok, "hello"}
