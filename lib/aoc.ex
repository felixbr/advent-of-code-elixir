defmodule AOC do

  def load_input_lines(day, type \\ :full) do
    Application.app_dir(:advent_of_code, "/priv/2022/#{day}_#{type}.txt")
    |> File.read!
    |> String.split("\n")
  end
end
