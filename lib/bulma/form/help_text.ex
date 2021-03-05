defmodule Bulma.Form.HelpText do
  use Surface.Component

  prop color, :string, values: Bulma.Helpers.Color.colors()
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <p class={{ "help", @class, "is-#{@color}": @color }}><slot /></p>
    """
  end
end
