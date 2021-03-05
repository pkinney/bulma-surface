defmodule Bulma.Elements.Notification do
  use Surface.Component

  prop color, :string, values: Bulma.Helpers.Color.colors()
  prop light, :boolean, default: false
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{
      "notification",
      "#{@class}": @class,
      "is-#{@color}": @color,
      "is-light": @light
    }}>
      <slot />
    </div>
    """
  end
end
