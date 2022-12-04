defmodule AOC3 do
  # https://adventofcode.com/2022/day/3

  @item_priority_mapping (Enum.to_list(?a..?z) ++ Enum.to_list(?A..?Z))
                         |> Enum.map(fn character_num -> to_string([character_num]) end)
                         |> Enum.with_index(1)
                         |> Map.new

  def part_1(input_lines) do
    items_by_compartment(input_lines)
    |> Enum.map(fn {compA, compB} ->
      MapSet.intersection(compA, compB) |> MapSet.to_list |> List.first
    end)
    |> Enum.map(&item_priority/1)
    |> Enum.sum
  end

  def part_2(input_lines) do
    input_lines
    |> Enum.map(fn bag -> String.graphemes(bag) |> MapSet.new end)
    |> Enum.chunk_every(3)
    |> Enum.map(fn bags ->
      Enum.reduce(bags, fn a, b -> MapSet.intersection(a, b) end) |> MapSet.to_list |> List.first
    end)
    |> Enum.map(&item_priority/1)
    |> Enum.sum
  end

  defp items_by_compartment(input_lines) do
    input_lines
    |> Enum.map(fn line ->
      line_length = String.length(line)
      middle_index = (line_length / 2) |> trunc

      {
        String.slice(line, 0..middle_index - 1) |> String.graphemes |> MapSet.new,
        String.slice(line, middle_index, line_length - 1) |> String.graphemes |> MapSet.new
      }
    end)
  end

  defp item_priority(item) do
    Map.fetch!(@item_priority_mapping, item)
  end
end
