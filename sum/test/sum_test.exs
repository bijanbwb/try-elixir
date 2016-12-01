defmodule SumTest do
  use ExUnit.Case
  doctest Sum

  test "Sum.of(1) should equal 1" do
    assert Sum.of(1) == 1
  end

  test "Sum.of(2) should equal 3" do
    assert Sum.of(2) == 3
  end

  test "Sum.of(3) should equal 6" do
    assert Sum.of(3) == 6
  end
end
