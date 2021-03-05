defmodule Bulma.Elements.IconText do
  use Surface.Component

  prop icon, :string, values: Bulma.Helpers.Icons.all_icons()
  prop label, :string
  prop color, :string, values: Bulma.Helpers.Color.colors()

  prop size, :string, values: ~w(lg 2x 3x)
  prop container_size, :string, values: ~w(small medium large)

  prop class, :css_class
  prop icon_class, :css_class
  prop text_class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <span class={{ "icon-text", @class, "has-text-#{@color}": @color }}>
      <Bulma.Elements.Icon
        icon={{ @icon }}
        class={{ @icon_class }}
        size={{ @size }}
        container_size={{ @container_size }}
      />
      <span class={{ @text_class, font_size(@size) }}><slot>{{ @label }}</slot></span>
    </span>
    """
  end

  defp font_size("lg"), do: "is-size-5"
  defp font_size("2x"), do: "is-size-3"
  defp font_size("3x"), do: "is-size-1"
  defp font_size(_), do: ""
end
