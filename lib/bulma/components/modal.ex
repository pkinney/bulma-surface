defmodule Bulma.Components.Modal do
  use Surface.Component

  prop class, :css_class
  prop close, :event
  prop clipped, :boolean
  prop box, :boolean, default: true

  prop active, :boolean

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{ "modal", @class, "is-active": @active, "is-clipped": @clipped }}>
      <div class="modal-background" />
      <div class="modal-content">
        <Bulma.Elements.Box :if={{ @box }}>
          <slot />
        </Bulma.Elements.Box>
        <slot :if={{ !@box }} />
      </div>
      <button class="modal-close is-large" aria-label="close" :on-click={{ @close }} :if={{ @close }} />
    </div>
    """
  end
end
