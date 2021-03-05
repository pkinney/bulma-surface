defmodule Bulma.Components.Navbar do
  use Surface.LiveComponent

  prop fixed_top, :boolean
  prop fixed_bottom, :boolean
  prop color, :string, values: Bulma.Helpers.Color.background_colors()
  prop class, :css_class

  data menu_active, :boolean, default: false

  slot brand
  slot left
  slot right

  def mount(socket) do
    {:ok, socket |> assign(menu_active: false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <nav class={{
      "navbar",
      @class,
      "is-fixed-top": @fixed_top,
      "is-fixed-bottom": @fixed_bottom,
      "is-#{@color}": @color
    }}>
      <div class="navbar-brand" :if={{ slot_assigned?(:brand) }}>
        <slot name="brand" />
        <Bulma.Components.Navbar.Burger click="navbar-burger-click" />
      </div>

      <div class={{ "navbar-menu", "is-active": @menu_active }}>
        <div class="navbar-start">
          <slot name="left" />
        </div>
        <div class="navbar-end">
          <slot name="right" />
        </div>
      </div>
    </nav>
    """
  end

  @impl true
  def handle_event("navbar-burger-click", _, socket),
    do: {:noreply, socket |> assign(menu_active: !socket.assigns.menu_active)}
end
