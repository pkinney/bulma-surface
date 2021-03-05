defmodule Bulma.Elements.Buttons do
  use Surface.Component

  prop addons, :boolean, default: false
  prop alignment, :string, values: ~w(centered right)
  prop size, :string, values: ~w(small medium large)
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{
      "buttons",
      @class,
      "has-addons": @addons,
      "is-#{@alignment}": @alignment,
      "are-#{@size}": @size
    }}>
      <slot />
    </div>
    """
  end
end
