defmodule Bulma.Elements.Tags do
  use Surface.Component

  prop addons, :boolean, default: false
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{
      "tags",
      @class,
      "has-addons": @addons
    }}>
      <slot />
    </div>
    """
  end
end
