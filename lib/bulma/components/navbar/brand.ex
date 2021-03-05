defmodule Bulma.Components.Navbar.Brand do
  use Surface.Component

  prop url, :string
  prop src, :string
  prop width, :integer, default: 112
  prop height, :integer, default: 28

  prop class, :css_class

  prop no_burger, :boolean

  @impl true
  def render(assigns) do
    ~H"""
    <a class={{ "navbar-item", @class }} href={{ @url }}>
      <img src={{ @src }} width={{ @width }} height={{ @height }}>
    </a>
    """
  end
end
