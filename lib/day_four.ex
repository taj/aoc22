defmodule DayFour do
  def part_1 do
    input()
    |> Enum.map(&format/1)
    |> Enum.count(fn {first, second} ->
      if MapSet.size(first) > MapSet.size(second) do
        MapSet.subset?(second, first)
      else
        MapSet.subset?(first, second)
      end
    end)
  end

  def part_2 do
    input()
    |> Enum.map(&format/1)
    |> Enum.count(fn {first, second} ->
      empty = MapSet.new()

      if MapSet.size(first) > MapSet.size(second) do
        MapSet.intersection(first, second) != empty
      else
        MapSet.intersection(second, first) != empty
      end
    end)
  end

  defp input do
    "lib/inputs/day_four"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
  end

  defp format(line) do
    [start_1, end_1, start_2, end_2] =
      line
      |> String.split(",")
      |> Enum.flat_map(&String.split(&1, "-"))
      |> Enum.map(&String.to_integer/1)

    first = MapSet.new(start_1..end_1)
    second = MapSet.new(start_2..end_2)

    {first, second}
  end
end
