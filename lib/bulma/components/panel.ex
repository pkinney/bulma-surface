defmodule Bulma.Components.Panel do
  use Surface.Component

  prop title, :string
  prop color, :string, values: Bulma.Helpers.Color.colors()

  prop class, :css_class

  slot default
  slot heading

  @impl true
  def render(assigns) do
    ~H"""
    <nav class={{ "panel", @class, "is-#{@color}": @color }}>
      <p class="panel-heading" :if={{ slot_assigned?(:heading) || @title }}>
        <slot name="heading">{{ @title }}</slot>
      </p>
      <slot />
    </nav>
    """
  end
end
