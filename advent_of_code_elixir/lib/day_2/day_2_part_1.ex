defmodule Day2.Day2Part1 do
  alias Day2.Game
  alias Day2.CubeSet

  def run do
    IO.puts("Starting")
    games = File.read!("day_2.txt") |> String.split("\n") |> convert_lines_to_games()

    total_game_ids =
      games
      |> Enum.reduce(0, fn game, acc ->
        if is_desired_game?(game) do
          acc + game.game_id
        else
          acc
        end
      end)

    IO.puts("")
    IO.puts(total_game_ids)
    :ok
  end

  @spec convert_lines_to_games(list()) :: list()
  def convert_lines_to_games(lines) do
    Enum.map(lines, &convert_line_to_game/1)
  end

  @spec convert_line_to_game(binary()) :: %Day2.Game{cube_sets: list(), game_id: integer()}
  def convert_line_to_game(line) do
    cube_sets = line |> clean_line(1) |> String.split(";") |> Enum.map(&CubeSet.from_str/1)
    level = line |> get_level_from_line()

    %Game{game_id: level, cube_sets: cube_sets}
  end

  @spec clean_line(String.t(), integer()) :: String.t()
  def clean_line(line, part) do
    line |> String.split(":") |> Enum.at(part)
  end

  @spec get_level_from_line(String.t()) :: integer()
  def get_level_from_line(line) do
    line
    |> clean_line(0)
    |> String.split(" ")
    |> Enum.at(1)
    |> String.trim()
    |> String.to_integer()
  end

  @spec is_desired_game?(any()) :: boolean()
  def is_desired_game?(game) do
    red_cube_max = game.cube_sets |> Enum.max_by(fn cube_set -> cube_set.red_cubes end)
    green_cube_max = game.cube_sets |> Enum.max_by(fn cube_set -> cube_set.green_cubes end)
    blue_cube_max = game.cube_sets |> Enum.max_by(fn cube_set -> cube_set.blue_cubes end)

    red_cube_max.red_cubes <= 12 &&
      green_cube_max.green_cubes <= 13 &&
      blue_cube_max.blue_cubes <= 14
  end
end
