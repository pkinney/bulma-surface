defmodule Bulma.Helpers.Icons do
  @map File.read!("./static/fa_icons.txt")
       |> String.trim()
       |> String.split("\n")
       |> Enum.reduce(%{}, fn a, acc ->
         [k, v] = String.split(a, "|")
         Map.put(acc, k, v)
       end)
  @icons Map.keys(@map)
  def all_icons(), do: @icons

  def icon_to_class(icon) do
    @map
    |> case do
      %{^icon => class} -> class
      _ -> ""
    end
  end
end
