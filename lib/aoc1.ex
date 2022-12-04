defmodule AOC1 do
  # https://adventofcode.com/2022/day/1

  def part_1(input_lines) do
    top_n_calories_summed(input_lines, 1)
  end

  def part_2(input_lines) do
    top_n_calories_summed(input_lines, 3)
  end

  defp top_n_calories_summed(input_lines, n) do
    input_lines
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.filter(&(&1 != [""]))
    |> Enum.map(fn carried_calories ->
      carried_calories
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum
    end)
    |> Enum.sort(:desc)
    |> Enum.take(n)
    |> Enum.sum
  end
end
