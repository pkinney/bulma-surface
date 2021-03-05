defmodule Bulma.Elements.Icon do
  use Surface.Component

  prop icon, :string, required: true, values: Bulma.Helpers.Icons.all_icons()
  prop color, :string, values: Bulma.Helpers.Color.text_colors()
  prop size, :string, values: ~w(lg 2x 3x)
  prop container_size, :string, values: ~w(small medium large)
  prop fixed_width, :boolean, default: false
  prop bordered, :boolean, default: false
  prop pulse, :boolean, default: false
  prop rotate, :integer, values: [90, 180, 270]
  prop flip, :string, values: ~w(h v)
  # TODO: stacked icons
  prop class, :css_class

  @impl true
  def render(assigns) do
    ~H"""
    <span class={{
      "icon",
      @class,
      "has-text-#{@color}": @color,
      "is-#{@container_size}": @container_size
    }}>
      <i
        class={{
          Bulma.Helpers.Icons.icon_to_class(@icon),
          "fa-#{@size}": @size,
          "fa-fw": @fixed_width,
          "fa-border": @bordered,
          "fa-pulse": @pulse
        }}
        data-fa-transform={{if @rotate do
          "rotate-#{@rotate}"
        end}}
        data-fa-transform={{if @flip do
          "flip-#{@flip}"
        end}}
      />
    </span>
    """
  end
end
