defmodule Bulma.Components.Breadcrumb do
  use Surface.Component

  prop alignment, :string, values: ~w(centered right)
  prop separator, :string, values: ~w(arrow bullet dot succeeds)
  prop size, :string, values: ~w(small medium large)
  prop class, :css_class

  # TODO: Icon

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <nav class={{
      "breadcrumb",
      @class,
      "is-#{@alignment}": @alignment,
      "has-#{@separator}-separator": @separator,
      "is-#{@size}": @size
    }}>
      <ul>
        <slot />
      </ul>
    </nav>
    """
  end
end
