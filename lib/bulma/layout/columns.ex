defmodule Bulma.Layout.Columns do
  use Surface.Component

  prop breakpoint, :string
  prop gapless, :boolean, default: false
  prop gap, :integer, values: [1, 2, 3, 4, 5, 6, 7, 8]

  prop centered, :boolean, default: false
  prop vcentered, :boolean, default: false
  prop multiline, :boolean, default: false

  prop class, :css_class

  slot default, required: true

  def render(assigns) do
    ~H"""
    <div class={{
      "columns",
      @class,
      "is-#{@breakpoint}": @breakpoint,
      "is-gapless": @gapless,
      "is-#{@gap}": @gap,
      "is-multiline": @multiline,
      "is-centered": @centered,
      "is-vcentered": @vcentered
    }}>
      <slot />
    </div>
    """
  end
end
