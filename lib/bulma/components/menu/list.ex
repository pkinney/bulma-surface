defmodule Bulma.Components.Menu.List do
  use Surface.Component

  prop class, :css_class
  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <ul class={{ "menu-list", @class }}>
      <slot />
    </ul>
    """
  end
end
