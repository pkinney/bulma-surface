defmodule Bulma.Components.Navbar.Divider do
  use Surface.Component

  prop class, :css_class

  @impl true
  def render(assigns) do
    ~H"""
    <hr class={{ "navbar-divider", @class }}>
    """
  end
end
