defmodule DayOne do
  def part_1 do
    input()
    |> Enum.map(fn calories ->
      calories |> Enum.map(&String.to_integer/1) |> Enum.sum()
    end)
    |> Enum.max()
  end

  def part_2 do
    input()
    |> Enum.map(fn calories ->
      calories |> Enum.map(&String.to_integer/1) |> Enum.sum()
    end)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp input do
    "lib/inputs/day_one"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.reject(&(&1 == [""]))
  end
end
