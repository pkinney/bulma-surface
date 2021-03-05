defmodule Bulma.Elements.Button do
  use Surface.Component

  prop label, :string

  prop click, :event
  prop confirm, :string
  prop disabled, :boolean, default: false

  prop color, :string,
    values: Bulma.Helpers.Color.colors() ++ ~w(white black light dark text ghost)

  prop light, :boolean, default: false
  prop size, :string, values: ~w(small normal medium large)
  prop fullwidth, :boolean, default: false
  prop outlined, :boolean, default: false
  prop inverted, :boolean, default: false
  prop rounded, :boolean, default: false
  prop hovered, :boolean, default: false
  prop focused, :boolean, default: false
  prop active, :boolean, default: false
  prop selected, :boolean, default: false
  prop loading, :boolean, default: false
  prop static, :boolean, default: false

  prop data, :any

  prop icon, :string, values: Bulma.Helpers.Icons.all_icons()
  prop icon_size, :string, values: ~w(lg 2x 3x)
  prop icon_container_size, :string, values: ~w(small medium large)

  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <button
      type="button"
      :on-click={{ @click }}
      phx-value-data={{ @data }}
      data-confirm={{ @confirm }}
      disabled={{ @disabled }}
      class={{
        "button",
        @class,
        "is-#{@color}": @color,
        "is-#{@size}": @size,
        "is-light": @light,
        "is-fullwidth": @fullwidth,
        "is-outlined": @outlined,
        "is-inverted": @inverted,
        "is-rounded": @rounded,
        "is-hovered": @hovered,
        "is-focused": @focused,
        "is-active": @active,
        "is-selected": @selected,
        "is-loading": @loading,
        "is-static": @static
      }}
    >
      <Bulma.Elements.Icon
        icon={{ @icon }}
        size={{ @icon_size }}
        container_size={{ @icon_container_size }}
        :if={{ @icon }}
      />
      <span :if={{ @label || slot_assigned?(:default) }}><slot>{{ @label }}</slot></span>
    </button>
    """
  end
end
