defmodule Physics.Rocketry do

  def escape_velocity(:earth) do
    %{mass: 5.972e24, radius: 6.371e6}
    |> escape_velocity()
  end

  def escape_velocity(:mars) do
    %{mass: 6.39e23, radius: 3.4e6}
    |> escape_velocity()
  end

  def escape_velocity(:moon) do
    %{mass: 7.35e22, radius: 1.738e6}
    |> escape_velocity()
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
    |> calculate_escape()
    |> convert_to_km()
    |> rounded_to_nearest_tenth()
  end

  defp rounded_to_nearest_tenth(val) do
    Float.ceil(val, 1)
  end

  defp convert_to_km(val) do
    val / 1000
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    newtons_constant = 6.67e-11

    2 * newtons_constant * mass / radius
    |> :math.sqrt
  end

end