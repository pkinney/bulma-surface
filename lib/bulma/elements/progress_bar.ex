defmodule Bulma.Elements.ProgressBar do
  use Surface.Component

  prop value, :integer
  prop max, :integer, default: 100
  prop color, :string, values: Bulma.Helpers.Color.colors()
  prop size, :string, values: ~w(small normal medium large)
  prop indeterminate, :boolean, default: false

  prop class, :css_class

  @impl true
  def render(assigns) do
    ~H"""
    <progress
      value={{ @value }}
      max={{ @max }}
      class={{
        "progress",
        @class,
        "is-#{@color}": @color,
        "is-#{@size}": @size
      }}
    >
      <slot>{{ @value }}</slot>
    </progress>
    """
  end
end
