defmodule Calc do

  @moduledoc """
  Functions for performing calculations.
  """
  @vsn 0.1

  @doc """
  Prints hello to user.
  """

  @spec hello(charlist()) :: charlist()

  def hello(name \\ "World") do
    "Hello " <> name
  end

  @doc """
  Adds two numbers together.
  """

  @spec add(number(), number()) :: number()

  def add(a, b) do
    a + b
  end

  @doc """
  Subtracts one number from another.
  """

  @spec sub(number(), number()) :: number()

  def sub(a, b) do
    a - b
  end

  @doc """
  Returns the absolute value for a negative number.
  """

  @spec absolute(number()) :: number()

  def absolute(number) when number < 0 do
    - number
  end

  @doc """
  Returns the absolute value for a positive number.
  """

  @spec absolute(number()) :: number()

  def absolute(number) do
    number
  end

  @doc """
  Increments a number by one.
  """

  @spec inc(number()) :: number()

  def inc(a) do
    a + 1
  end

  @doc """
  Decrements a number by one.
  """

  @spec dec(number()) :: number()

  def dec(a) do
    a - 1
  end

end
