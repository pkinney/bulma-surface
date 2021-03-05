defmodule Bulma.Components.Dropdown.DividerItem do
  use Surface.Component

  prop class, :css_class

  @impl true
  def render(assigns) do
    ~H"""
    <hr class={{ "dropdown-divider", @class }}>
    """
  end
end
