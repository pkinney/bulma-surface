defmodule Bulma.Elements.Block do
  use Surface.Component

  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{ "block", "#{@class}": @class }}><slot /></div>
    """
  end
end
