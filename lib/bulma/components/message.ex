defmodule Bulma.Components.Message do
  use Surface.Component

  prop title, :string
  prop delete, :event
  prop color, :string, values: ["dark"] ++ Bulma.Helpers.Color.colors()
  prop size, :string, values: ~w(small normal medium large)
  prop class, :css_class

  slot default
  slot header

  @impl true
  def render(assigns) do
    ~H"""
    <article class={{ "message", @class, "is-#{@color}": @color, "is-#{@size}": @size }}>
      <div class="message-header" :if={{ @title || slot_assigned?(:header) }}>
        <slot name="header">
          <p>{{ @title }}</p>
          <Bulma.Elements.Delete click={{ @delete }} :if={{ @delete }} />
        </slot>
      </div>
      <div class="message-body">
        <slot />
      </div>
    </article>
    """
  end
end
