defmodule Bulma.Components.Panel.AnchorBlock do
  use Surface.Component

  prop active, :boolean, default: false
  prop label, :string
  prop url, :string, default: "#"
  prop click, :event

  prop icon, :string, values: Bulma.Helpers.Icons.all_icons()
  prop icon_size, :string, values: ~w(lg 2x 3x)
  prop icon_container_size, :string, values: ~w(small medium large)

  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <a
      class={{ "panel-block", @class, "is-active": @active }}
      href="{{ @url }}"
      :on-click={{ @click }}
    >
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
