defmodule Bulma.Layout.Column do
  use Surface.Component

  @sizes Enum.map(1..12, &Integer.to_string/1) ++
           ~w(three-quarters is-two-thirds is-half is-one-third is-one-quarter is-full is-four-fifths is-three-fifths is-two-fifths is-one-fifth)

  prop size, :string, values: @sizes
  prop offset, :string, values: @sizes

  prop narrow, :boolean, default: false
  prop narrow_breakpoint, :string, values: Bulma.Helpers.Visibility.breakpoints()

  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{
      "column",
      @class,
      "is-#{@size}": @size,
      "is-offset-#{@offset}": @offset,
      "is-narrow": @narrow,
      "is-narrow-#{@narrow_breakpoint}": @narrow_breakpoint
    }}>
      <slot />
    </div>
    """
  end
end
