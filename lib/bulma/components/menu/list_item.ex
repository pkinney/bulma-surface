defmodule Bulma.Components.Menu.ListItem do
  use Surface.Component

  prop label, :string
  prop url, :string
  prop click, :event
  prop icon, :string, values: Bulma.Helpers.Icons.all_icons()
  prop active, :boolean
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <a class={{ @class, "is-active": @active }} href={{ @url }} :on-click={{ @click }}>
      <Bulma.Elements.Icon icon={{ @icon }} :if={{ @icon }} />
      <slot>{{ @label }}</slot>
    </a>
    """
  end
end
