defmodule Day2.CubeSet do
  defstruct red_cubes: 0, green_cubes: 0, blue_cubes: 0

  @spec from_str(binary()) :: %Day2.CubeSet{
          blue_cubes: integer(),
          green_cubes: integer(),
          red_cubes: integer()
        }
  def from_str(str) do
    values = str |> String.split(",") |> Enum.map(&String.trim/1)

    red_value = values |> Enum.filter(fn item -> item |> String.contains?("red") end)
    green_value = values |> Enum.filter(fn item -> item |> String.contains?("green") end)
    blue_value = values |> Enum.filter(fn item -> item |> String.contains?("blue") end)

    red_cubes =
      case red_value |> Enum.count() == 1 do
        true ->
          red_value |> Enum.at(0) |> String.split(" ") |> Enum.at(0) |> String.to_integer()

        false ->
          0
      end

    green_cubes =
      case green_value |> Enum.count() == 1 do
        true ->
          green_value |> Enum.at(0) |> String.split(" ") |> Enum.at(0) |> String.to_integer()

        false ->
          0
      end

    blue_cubes =
      case blue_value |> Enum.count() == 1 do
        true ->
          blue_value |> Enum.at(0) |> String.split(" ") |> Enum.at(0) |> String.to_integer()

        false ->
          0
      end

    %Day2.CubeSet{red_cubes: red_cubes, green_cubes: green_cubes, blue_cubes: blue_cubes}
  end
end
