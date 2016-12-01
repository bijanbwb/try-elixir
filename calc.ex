defmodule Calc do
  @moduledoc """
  Functions for performing calculations.
  """
  @vsn 0.1

  @doc """
  Prints hello message to user.
  """
  @spec hello(String) :: String
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

  @doc """
  Prints a tuple of atoms and numbers.
  """
  @spec print_tuple() :: String
  def print_tuple() do
    tuple = {:one, 1}
    atom = elem(tuple, 0)
    num = elem(tuple, 1)
    "Elements: " <> to_string(atom) <> " " <> to_string(num)
  end

  @doc """
  Returns a number based on an atom from `:one` to `:three`.
  """
  @spec print_number(atom()) :: number()
  def print_number(number) do
    case number do
      :one -> 1
      :two -> 2
      :three -> 3
    end
  end

  @doc """
  Recursively counts down from a number argument to zero.

  Returns atom() `:ok` if successful with `IO` side effect to print count.
  """
  @spec countdown(number()) :: atom()
  def countdown(from) when from > 0 do
    IO.inspect(from)
    countdown(from - 1)
  end

  @doc """
  After the countdown() function above has reached zero,
  print `"Blast off!"` to standard output.

  Returns atom() `:ok` if successful with `IO` side effect to print output.
  """
  @spec countdown(number()) :: atom()
  def countdown(from) do
    if from == 0 do
      IO.puts("Blast off!")
    end
  end

  @doc """
  Takes in a number and returns its factorial using recursion.
  """
  @spec factorial(number()) :: number()
  def factorial(number) do
    if number > 1 do
      number * factorial(number - 1)
    else
      1
    end
  end

  @doc """
  Create a list of 10 numbers with `List` functions.
  """
  @spec lists() :: list()
  def lists() do
    a = [1, 2, 3, 4]
    b = [5, 6, 7, 8]
    c = Enum.concat(a, b)
    d = [c, [9, 10]]
    e = List.flatten(d)
    [head | tail] = e
    head ++ tail
  end

  @doc """
  Try out key-value pair functions.
  """
  @spec pairs() :: list()
  def pairs() do
    ages = [bijan: 32, aimee: 31]
    if Keyword.has_key?(ages, :bijan) do
      IO.puts("Bijan is #{Keyword.get(ages, :bijan)} years old.")
    end

    ages_updated = Keyword.put_new(ages, :riley, 1)
    if Keyword.has_key?(ages_updated, :riley) do
      IO.puts("Riley is #{Keyword.get(ages_updated, :riley)} year old.")
    end
  end

  @doc """
  Uses process to send a message and return 10 times the argument.
  """
  @spec times_ten(number()) :: number()
  def times_ten(number) do
    pid = self()
    send(pid, number)
    receive do
      x -> x * 10
    end
  end
end

