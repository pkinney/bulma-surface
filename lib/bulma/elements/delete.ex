defmodule Bulma.Elements.Delete do
  use Surface.Component

  prop click, :event
  prop class, :css_class

  @impl true
  def render(assigns) do
    ~H"""
    <a class={{ "delete", @class }} :on-click={{ @click }} />
    """
  end
end
