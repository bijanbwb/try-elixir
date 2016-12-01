defmodule Double do
  @moduledoc """
  Macro for doubling a number value.
  """
  @vsn 0.1

  @doc """
  Uses macro quote syntax to double a number.

  Usage:
  ```elixir
  c("double.ex")
  require Double
  Double.double(10)
  # => 20
  ```
  """
  @spec double(number) :: number()
  defmacro double(x) do
    quote do
      2 * unquote(x)
    end
  end
end

