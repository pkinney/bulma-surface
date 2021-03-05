defmodule Bulma.Components.Dropdown do
  use Surface.LiveComponent

  prop label, :string
  prop trigger_icon, :string, values: Bulma.Helpers.Icons.all_icons()
  prop color, :string, values: Bulma.Helpers.Color.colors()
  prop icon, :string, values: Bulma.Helpers.Icons.all_icons()
  prop hoverable, :boolean
  prop alignment, :string, values: ~w(right)
  prop up, :boolean
  prop class, :css_class

  data active, :boolean, default: false

  slot default, required: true

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{
      "dropdown",
      @class,
      "is-active": @active,
      "is-hoverable": @hoverable,
      "is-#{@alignment}": @alignment,
      "is-up": @up,
      "is-#{@color}": @color
    }}>
      <div class="dropdown-trigger">
        <Bulma.Elements.Button
          color={{ @color }}
          icon={{ @icon }}
          click={{if @hoverable do
            nil
          else
            "toggle-dropdown"
          end}}
        >
          <span>{{ @label }}</span>
          <Bulma.Elements.Icon
            icon={{@trigger_icon ||
              if @up do
                "angle-up"
              else
                "angle-down"
              end}}
            size="small"
          />
        </Bulma.Elements.Button>
      </div>
      <div class="dropdown-menu" id="dropdown-menu" role="menu">
        <div class="dropdown-content">
          <slot />
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("toggle-dropdown", _, socket) do
    {:noreply, socket |> assign(:active, !socket.assigns.active)}
  end
end
