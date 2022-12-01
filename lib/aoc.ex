defmodule AOC do

  def day_1_part_1(input_lines) do
    day_1_top_n_calories_summed(input_lines, 1)
  end

  def day_1_part_2(input_lines) do
    day_1_top_n_calories_summed(input_lines, 3)
  end

  # https://adventofcode.com/2022/day/1
  defp day_1_top_n_calories_summed(input_lines, n) do
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

  def load_input_lines(day, type \\ "full") do
    Application.app_dir(:advent_of_code, "/priv/2022/#{day}_#{type}.txt")
    |> File.read!
    |> String.split("\n")
  end
end
