defmodule Bulma.Layout.Footer do
  use Surface.Component

  prop class, :css_class
  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <footer class={{ "footer", @class }}>
      <slot />
    </footer>
    """
  end
end
