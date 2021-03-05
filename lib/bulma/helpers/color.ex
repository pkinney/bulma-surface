defmodule Bulma.Helpers.Color do
  def black_white_colors(), do: ~w(white black light dark)

  def grayscale_colors(),
    do:
      black_white_colors() ++
        ~w(black-bis black-ter grey-darker grey-dark grey grey-light grey-lighter white-ter white-bis)

  def colors(), do: ~w(primary link info success warning danger)
  def text_colors(), do: append_light_dark(colors()) ++ grayscale_colors()
  def background_colors(), do: append_light_dark(colors()) ++ grayscale_colors()

  defp append_light_dark(colors) do
    colors
    |> Enum.reduce(colors, fn color, acc ->
      acc ++ ["#{color}-light", "#{color}-dark"]
    end)
  end
end
