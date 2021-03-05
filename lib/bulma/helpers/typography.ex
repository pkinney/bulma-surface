defmodule Bulma.Helpers.Typography do
  def sizes(), do: [1, 2, 3, 4, 5, 6, 7]
  def alignments(), do: ~w(centered justified left right)
  def text_transformations(), do: ~w(capitalized lowercase uppercase italic)
  def text_weights(), do: ~w(light normal medium semibold bold)
  def fond_famlies(), do: ~w(sans-serif monospace primary secondary code)

  # TODO - Add responsive alignments? - https://bulma.io/documentation/helpers/typography-helpers/#responsive-alignment
  # TODO - Add responsive sizes? - https://bulma.io/documentation/helpers/typography-helpers/#responsive-size
end
