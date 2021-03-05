defmodule Bulma.Components.Navbar.Dropdown do
  use Surface.Component

  prop label, :string
  prop hoverable, :boolean
  prop active, :boolean
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{ "navbar-item has-dropdown", @class, "is-hoverable": @hoverable, "is-active": @active }}>
      <a class="navbar-link">
        {{ @label }}
      </a>

      <div class="navbar-dropdown">
        <slot />
      </div>
    </div>
    """
  end
end
