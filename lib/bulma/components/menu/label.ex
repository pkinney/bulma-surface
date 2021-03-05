defmodule Bulma.Components.Menu.Label do
  use Surface.Component

  prop label, :string
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <p class={{ "menu-label", @class }}>
      <slot>{{ @label }}</slot>
    </p>
    """
  end
end
