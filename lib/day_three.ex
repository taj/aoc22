defmodule DayThree do
  def part_1 do
    input()
    |> Enum.reduce([], fn line, acc ->
      common_letters = intersections(line)
      acc ++ common_letters
    end)
    |> total_score()
  end

  def part_2 do
    input()
    |> Enum.chunk_every(3)
    |> Enum.flat_map(&find_badge/1)
    |> total_score()
  end

  defp total_score(letters) do
    Enum.reduce(letters, 0, fn x, acc ->
      acc + score(x)
    end)
  end

  # Converting a letter into their ASCII code
  # 'a' means 97
  # 'z' means 122
  # 'A' means 65
  # 'Z' means 90
  defp score(<<l::utf8>>) when l <= 90 do
    l - 38
  end

  defp score(<<l::utf8>>) do
    l - 96
  end

  defp intersections(line) do
    length = String.length(line)
    {p1, p2} = String.split_at(line, div(length, 2))
    p1 = p1 |> String.codepoints() |> MapSet.new()
    p2 = p2 |> String.codepoints() |> MapSet.new()
    p1 |> MapSet.intersection(p2) |> MapSet.to_list()
  end

  defp find_badge([l1, l2, l3]) do
    l1 = l1 |> String.codepoints() |> MapSet.new()
    l2 = l2 |> String.codepoints() |> MapSet.new()
    l3 = l3 |> String.codepoints() |> MapSet.new()
    l1 |> MapSet.intersection(l2) |> MapSet.intersection(l3) |> MapSet.to_list()
  end

  defp input do
    "lib/inputs/day_three"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
  end
end
