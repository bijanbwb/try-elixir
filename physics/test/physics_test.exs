defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "escape velocity of earth is correct" do
    result = Physics.Rocketry.escape_velocity(:earth)
    assert result == 11.2
  end

  test "escape velocity of mars is correct" do
    result = Physics.Rocketry.escape_velocity(:mars)
    assert result == 5.1
  end

  test "escape velocity of the moon is correct" do
    result = Physics.Rocketry.escape_velocity(:moon)
    assert result == 2.4
  end

  test "escape velocity of planet X is correct" do
    result = %{mass: 4.0e22, radius: 6.21e6} |> Physics.Rocketry.escape_velocity()
    assert result == 1.0
  end
end
