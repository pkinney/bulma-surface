defmodule Bulma.Layout.Hero do
  use Surface.Component

  prop color, :string, values: Bulma.Helpers.Color.colors() ++ ~w(light dark)
  prop bold, :boolean, default: false
  prop size, :string, values: ~w(medium large fullheight)
  prop class, :css_class

  slot default
  slot head
  slot footer

  @impl true
  def render(assigns) do
    ~H"""
    <section class={{
      "hero",
      @class,
      "is-#{@color}": @color,
      "is-bold": @bold,
      "is-#{@size}": @size
    }}>
      <div class="hero-body">
        <slot />
      </div>
    </section>
    """
  end
end
