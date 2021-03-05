defmodule Bulma.Elements.Tag do
  use Surface.Component

  prop label, :string
  prop color, :string, values: Bulma.Helpers.Color.colors() ++ ~w(black dark light white)
  prop light, :boolean, default: false
  prop size, :string, values: ~w(normal medium large)
  prop rounded, :boolean, default: false
  prop delete, :boolean, default: false
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <span class={{
      "tag",
      @class,
      "is-#{@color}": @color,
      "is-light": @light,
      "is-#{@size}": @size,
      "is-rounded": @rounded,
      "is-delete": @delete
    }}>
      <slot>{{ @label }}</slot>
    </span>
    """
  end
end
