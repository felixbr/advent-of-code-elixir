defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  test "Day 1 Part 1" do
    output_sample = AOC.load_input_lines(1, "sample") |> AOC.day_1_part_1

    assert output_sample == 24000
  end

  test "Day 2 Part 2" do
    output_sample = AOC.load_input_lines(1, "sample") |> AOC.day_1_part_2

    assert output_sample == 45000
  end
end
