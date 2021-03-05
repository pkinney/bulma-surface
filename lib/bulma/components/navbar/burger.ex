defmodule Bulma.Components.Navbar.Burger do
  use Surface.Component

  prop class, :css_class
  prop click, :event

  @impl true
  def render(assigns) do
    ~H"""
    <a
      role="button"
      class={{ "navbar-burger", @class }}
      aria-label="menu"
      aria-expanded="false"
      :on-click={{ @click }}
    >
      <span aria-hidden="true" />
      <span aria-hidden="true" />
      <span aria-hidden="true" />
    </a>
    """
  end
end
