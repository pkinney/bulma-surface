defmodule Bulma.Components.Menu do
  use Surface.Component

  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <aside class={{ "menu", @class }}>
      <slot />
    </aside>
    """
  end
end
