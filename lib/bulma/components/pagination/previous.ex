defmodule Bulma.Components.Pagination.Previous do
  use Surface.Component

  prop class, :css_class
  prop label, :string
  prop click, :event
  prop disabled, :boolean

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <a class={{ "pagination-previous", @class }} :on-click={{ @click }} disabled={{ @disabled }}><slot>{{ @label }}</slot></a>
    """
  end
end
