defmodule Bulma.Elements.Title do
  use Surface.Component

  prop label, :string
  prop size, :integer, values: [1, 2, 3, 4, 5, 6], default: 1
  prop spaced, :boolean, default: false
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <p class={{
      "title",
      @class,
      "is-#{@size}": @size,
      "is-spaced": @spaced
    }}>
      <slot>{{ @label }}</slot>
    </p>
    """
  end
end
