defmodule DayTwo do
  # Legend:
  #  - A = X = Rock     = 1pt
  #  - B = Y = Paper    = 2pts
  #  - C = Z = Scissors = 3pts
  #
  #  - Loss             = 0pts
  #  - Draw             = 3pts
  #  - Win              = 6pts

  @win 6
  @draw 3
  @loss 0

  @x 1
  @y 2
  @z 3

  def part_1 do
    input()
    |> Enum.map(&score_part_1/1)
    |> Enum.sum()
  end

  def part_2 do
    input()
    |> Enum.map(&score_part_2/1)
    |> Enum.sum()
  end

  defp score_part_2("A X"), do: @loss + @z
  defp score_part_2("B X"), do: @loss + @x
  defp score_part_2("C X"), do: @loss + @y

  defp score_part_2("A Y"), do: @draw + @x
  defp score_part_2("B Y"), do: @draw + @y
  defp score_part_2("C Y"), do: @draw + @z

  defp score_part_2("A Z"), do: @win + @y
  defp score_part_2("B Z"), do: @win + @z
  defp score_part_2("C Z"), do: @win + @x

  defp score_part_1("A X"), do: @x + @draw
  defp score_part_1("B X"), do: @x + @loss
  defp score_part_1("C X"), do: @x + @win

  defp score_part_1("A Y"), do: @y + @win
  defp score_part_1("B Y"), do: @y + @draw
  defp score_part_1("C Y"), do: @y + @loss

  defp score_part_1("A Z"), do: @z + @loss
  defp score_part_1("B Z"), do: @z + @win
  defp score_part_1("C Z"), do: @z + @draw

  def input do
    "lib/inputs/day_two"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
  end
end
