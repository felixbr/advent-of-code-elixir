defmodule AOC2Test do
  use ExUnit.Case
  doctest AOC2

  test "Day 2 Part 1" do
    output_sample = AOC.load_input_lines(2, "sample") |> AOC2.part_1

    assert output_sample == 15
  end

  test "Day 2 Part 2" do
    output_sample = AOC.load_input_lines(2, "sample") |> AOC2.part_2

    assert output_sample == 12
  end
end
