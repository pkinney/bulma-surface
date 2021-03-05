defmodule Bulma.Layout.Section do
  use Surface.Component

  prop spacing, :string, values: ~w(medium large)
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <section class={{ "section", @class, "is-#{@spacing}": @spacing }}>
      <slot />
    </section>
    """
  end
end
