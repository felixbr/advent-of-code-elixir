defmodule AOC2 do
  # https://adventofcode.com/2022/day/2

  def part_1(input_lines) do
    rounds(input_lines)
    |> Enum.map(&part_1_points_for_round/1)
    |> Enum.sum
  end

  def part_2(input_lines) do
    rounds(input_lines)
    |> Enum.map(fn {opponent_move, encoded_outcome} -> {opponent_move, part_2_expected_outcome(encoded_outcome)} end)
    |> Enum.map(&part_2_points_for_round/1)
    |> Enum.sum
  end

  defp rounds(input_lines) do
    input_lines
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [opponent_move, player_move] -> {opponent_move, player_move} end)
  end

  defp part_1_points_for_round(round = {_opponent_move, player_move}) do
    outcome = case round do
      {"A", "X"} -> :draw
      {"B", "Y"} -> :draw
      {"C", "Z"} -> :draw
      {"A", "Y"} -> :win # Paper beats Rock
      {"B", "Z"} -> :win # Scissors beat Paper
      {"C", "x"} -> :win # Rock beats Scissors
      _ -> :loss
    end

    points_for_outcome(outcome) + points_for_chosen_move(player_move)
  end

  defp points_for_outcome(outcome) do
    case outcome do
      :win -> 6
      :draw -> 3
      :loss -> 0
    end
  end

  defp points_for_chosen_move(move) do
    case move do
      "A" -> 1
      "B" -> 2
      "C" -> 3
      "X" -> 1
      "Y" -> 2
      "Z" -> 3
    end
  end

  defp part_2_points_for_round(round = {_opponent_move, outcome}) do
    player_move = case round do
      {opponent_move, :draw} -> opponent_move
      {"A", :win} -> "B"  # Paper beats Rock
      {"A", :loss} -> "C" # Rock beats Scissors
      {"B", :win} -> "C"  # Scissors beat Paper
      {"B", :loss} -> "A" # Paper beats Rock
      {"C", :win} -> "A"  # Rock beats Scissors
      {"C", :loss} -> "B" # Scissors beat Paper
    end

    points_for_outcome(outcome) + points_for_chosen_move(player_move)
  end

  defp part_2_expected_outcome(encoded_outcome) do
    case encoded_outcome do
      "X" -> :loss
      "Y" -> :draw
      "Z" -> :win
    end
  end
end
