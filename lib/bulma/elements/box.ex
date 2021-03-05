defmodule Bulma.Elements.Box do
  use Surface.Component

  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{ "box", "#{@class}": @class }}><slot /></div>
    """
  end
end
