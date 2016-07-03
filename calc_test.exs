ExUnit.start

defmodule CalcTest do

  use ExUnit.Case, async: true

  test "Add function returns sum of two arguments" do
    assert Calc.add(5, 5) == 10
  end

end
