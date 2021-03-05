defmodule Bulma.Components.Navbar.Item do
  use Surface.Component

  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{ "navbar-item", @class }}><slot /></div>
    """
  end
end
