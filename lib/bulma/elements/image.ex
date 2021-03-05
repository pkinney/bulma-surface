defmodule Bulma.Elements.Image do
  use Surface.Component

  prop src, :string, required: true

  prop size, :string,
    values: [
      "16x16",
      "24x24",
      "32x32",
      "48x48",
      "64x64",
      "96x96",
      "128x128",
      "square",
      "1by1",
      "5by4",
      "4by3",
      "3by2",
      "5by3",
      "16by9",
      "2by1",
      "3by1",
      "4by5",
      "3by4",
      "2by3",
      "3by5",
      "9by16",
      "1by2",
      "1by3"
    ]

  prop rounded, :boolean
  prop class, :css_class
  prop img_class, :css_class

  @impl true
  def render(assigns) do
    ~H"""
    <figure class={{ "image", @class, "is-#{@size}": @size }}>
      <img class={{ @img_class, "is-rounded": @rounded }} src={{ @src }}>
    </figure>
    """
  end
end
