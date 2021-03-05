defmodule Bulma.Components.ModalCard do
  use Surface.Component

  prop class, :css_class
  prop close, :event
  prop clipped, :boolean
  prop box, :boolean, default: true

  prop title, :string

  prop active, :boolean

  slot default
  slot title_content

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{ "modal", @class, "is-active": @active, "is-clipped": @clipped }}>
      <div class="modal-background" />
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title"><slot name="title">{{ @title }}</slot></p>
          <Bulma.Elements.Delete click={{ @close }} :if={{ @close }} />
        </header>
        <section class="modal-card-body">
          <slot />
        </section>
        <footer class="modal-card-foot">
          <button class="button is-success">Save changes</button>
          <button class="button">Cancel</button>
        </footer>
      </div>
    </div>
    """
  end
end
