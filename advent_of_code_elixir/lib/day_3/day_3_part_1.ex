defmodule Day3.Day3Part1 do
  def run do
    result = File.read!("day_3.txt") |> String.split("\n") |> Enum.map(String.to_charlist())

    IO.puts(result)
    :ok
  end
end
