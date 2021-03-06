defmodule Bulma.Components.Dropdown.ContentItem do
  use Surface.Component

  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{ "dropdown-item", @class }}>
      <slot />
    </div>
    """
  end
end
