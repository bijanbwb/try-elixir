defmodule ListAtoms do
  def lat?([]), do: true
  def lat?([[_ | _] | _]), do: false
  def lat?([_ | tail]), do: lat?(tail)
end

defmodule Member do
  def member?([], _), do: false
  def member?([head | tail], item) do
    cond do
      head == item -> true
      true -> member?(tail, item)
    end
  end
end

defmodule Delete do
  def delete([], _), do: []
  def delete([head | tail], item) do
    cond do
      head == item -> tail
      true -> [head | delete(tail, item)]
    end
  end

  def rember(_, []), do: []
  def rember(n, [n | tail]), do: tail
  def rember(n, [head | tail]), do: [head | rember(n, tail)]

  def multirember([], _), do: []
  def multirember([head | tail], removal) do
    cond do
      head == removal -> multirember(tail, removal)
      true -> [head | multirember(tail, removal)]
    end
  end
end

defmodule Firsts do
  def firsts([]), do: []
  def firsts([[head | _] | tail]), do: [head | firsts(tail)]
end

defmodule Insert do
  def right([], _, _), do: []
  def right([head | tail], new, old) do
    cond do
      head == old -> [old, new | tail]
      true -> [head | right(tail, new, old)]
    end
  end

  def multiright([], _, _), do: []
  def multiright([head | tail], new, old) do
    cond do
      head == old -> [old, new | multiright(tail, new, old)]
      true -> [head | multiright(tail, new, old)]
    end
  end

  def insertR([], _, _), do: []
  def insertR([old | tail], new, old), do: [old, new | tail]
  def insertR([head | tail], new, old), do: [head | insertR(tail, new, old)]

  def left([], _, _), do: []
  def left([head | tail], new, old) do
    cond do
      head == old -> [new, old | tail]
      true -> [head | right(tail, new, old)]
    end
  end

  def multileft([], _, _), do: []
  def multileft([head | tail], new, old) do
    cond do
      head == old -> [new, old | multileft(tail, new, old)]
      true -> [head | multileft(tail, new, old)]
    end
  end

  def insertL([], _, _), do: []
  def insertL(list=[old | _], new, old), do: [new | list]
  def insertL([head | tail], new, old), do: [head | insertL(tail, new, old)]

  def subst([], _, _), do: []
  def subst([head | tail], new, old) do
    cond do
      head == old -> [new | tail]
      true -> [head | subst(tail, new, old)]
    end
  end

  def multisubst([], _, _), do: []
  def multisubst([old | tail], new, old), do: [new | multisubst(tail, new, old)]
  def multisubst([head | tail], new, old), do: [head | multisubst(new, old, tail)]
end

defmodule Tuple do
  def addtup([]), do: 0
  def addtup([head | tail]), do: head + addtup(tail)

  def add(0, m), do: m
  def add(n, m), do: 1 + add(n-1, m)

  def sub(n, 0), do: n
  def sub(n, m), do: sub(n, m-1) - 1

  def mult(n, 0), do: 0
  def mult(n, 1), do: n
  def mult(n, m), do: n + mult(n, m-1)
end

