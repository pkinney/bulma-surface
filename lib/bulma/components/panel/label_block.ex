defmodule Bulma.Components.Panel.LabelBlock do
  use Surface.Component

  prop active, :boolean, default: false
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <label class={{ "panel-block", @class, "is-active": @active }}>
      <slot />
    </label>
    """
  end
end
