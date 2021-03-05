defmodule Bulma.Elements.Content do
  use Surface.Component

  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{ "content", @class }}><slot /></div>
    """
  end
end
