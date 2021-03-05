defmodule Bulma.Components.Navbar.Link do
  use Surface.Component

  prop label, :string
  prop url, :string, default: "#"
  prop click, :event
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <a class={{ "navbar-item", @class }} href={{ @url }} :on-click={{ @click }}>
      <slot>{{ @label }}</slot>
    </a>
    """
  end
end
