defmodule Bulma.Components.Panel.Block do
  use Surface.Component

  prop active, :boolean, default: false
  prop label, :string

  prop icon, :string, values: Bulma.Helpers.Icons.all_icons()
  prop icon_size, :string, values: ~w(lg 2x 3x)
  prop icon_container_size, :string, values: ~w(small medium large)

  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <a class={{ "panel-block", @class, "is-active": @active }}>
      <Bulma.Elements.Icon
        class="panel-icon"
        icon={{ @icon }}
        size={{ @icon_size }}
        container_size={{ @icon_container_size }}
        :if={{ @icon }}
      />
      <slot>{{ @label }}</slot>
    </a>
    """
  end
end
