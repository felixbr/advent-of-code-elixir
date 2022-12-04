defmodule AOC1Test do
  use ExUnit.Case
  doctest AOC1

  test "Day 1 Part 1" do
    output_sample = AOC.load_input_lines(1, :sample) |> AOC1.part_1

    assert output_sample == 24000
  end

  test "Day 1 Part 2" do
    output_sample = AOC.load_input_lines(1, :sample) |> AOC1.part_2

    assert output_sample == 45000
  end
end
