defmodule AOC do

  def day_1_part_1(input_lines) do
    day_1_top_n_summed(input_lines, 1)
  end

  def day_1_part_2(input_lines) do
    day_1_top_n_summed(input_lines, 3)
  end

  defp day_1_top_n_summed(input_lines, n) do
    input_lines
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.filter(&(&1 != [""]))
    |> Enum.map(fn lists -> Enum.map(lists, &String.to_integer/1) end)
    |> Enum.with_index(1)
    |> Enum.map(fn {values, position} -> {values, Enum.sum(values), position} end)
    |> Enum.sort_by(&(elem(&1, 1)), :desc)
    |> Enum.take(n)
    |> Enum.map(&(elem(&1, 1)))
    |> Enum.sum
  end

  def load_input_lines(day, type \\ "full") do
    Application.app_dir(:advent_of_code, "/priv/2022/#{day}_#{type}.txt")
    |> File.read!
    |> String.split("\n")
  end
end
