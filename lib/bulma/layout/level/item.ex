defmodule Bulma.Layout.Level.Item do
  use Surface.Component

  prop class, :css_class
  prop alignment, :string, values: ~w(centered right)

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{ "level-item", @class, "has-text-#{@alignment}": @alignment }}>
      <slot />
    </div>
    """
  end
end
