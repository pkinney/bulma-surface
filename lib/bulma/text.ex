defmodule Bulma.Text do
  use Surface.Component

  prop class, :css_class
  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <p class={{ @class }}><slot /></p>
    """
  end
end
