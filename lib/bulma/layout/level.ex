defmodule Bulma.Layout.Level do
  use Surface.Component

  prop mobile, :boolean
  prop class, :css_class

  slot default
  slot left
  slot right

  @impl true
  def render(assigns) do
    ~H"""
    <nav class={{ "level", @class, "is-mobile": @mobile }}>
      <div class="level-left" :if={{ slot_assigned?(:left) }}>
        <slot name="left" />
      </div>

      <div class="level-right" :if={{ slot_assigned?(:right) }}>
        <slot name="right" />
      </div>

      <slot name="default" />
    </nav>
    """
  end
end
