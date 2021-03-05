defmodule Bulma.Layout.Container do
  use Surface.Component

  prop fluid, :boolean, default: false
  prop breakpoint, :string, values: Bulma.Helpers.Visibility.breakpoints()
  prop max_breakpoint, :string, values: Bulma.Helpers.Visibility.breakpoints()
  prop class, :css_class

  slot default, required: true

  def render(assigns) do
    ~H"""
    <div class={{
      "container",
      @class,
      "is-fluid": @fluid,
      "is-#{@breakpoint}": @breakpoint,
      "is-max-#{@max_breakpoint}": @max_breakpoint
    }}>
      <slot />
    </div>
    """
  end
end
