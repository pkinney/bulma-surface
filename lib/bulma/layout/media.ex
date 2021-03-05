defmodule Bulma.Layout.Media do
  use Surface.Component

  prop class, :css_class

  slot default
  slot left
  slot right

  @impl true
  def render(assigns) do
    ~H"""
    <article class={{ "media", @class }}>
      <div class="media-left" :if={{ slot_assigned?(:left) }}>
        <slot name="left" />
      </div>

      <div class="media-content">
        <slot />
      </div>

      <div class="media-right" :if={{ slot_assigned?(:right) }}>
        <slot name="right" />
      </div>
    </article>
    """
  end
end
