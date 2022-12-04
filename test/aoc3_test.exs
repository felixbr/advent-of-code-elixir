defmodule AOC3Test do
  use ExUnit.Case
  doctest AOC3

  test "Day 3 Part 1" do
    output_sample = AOC.load_input_lines(3, "sample") |> AOC3.part_1

    assert output_sample == 157
  end

  test "Day 3 Part 2" do
    output_sample = AOC.load_input_lines(3, "sample") |> AOC3.part_2

    assert output_sample == 70
  end
end
