defmodule Bulma.Components.Breadcrumb.Item do
  use Surface.Component

  prop label, :string
  prop active, :boolean, default: false
  prop url, :string, default: "#"
  prop class, :css_class

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <li class={{ "is-active": @active }}>
      <a href="{{ @url }}">
        <slot>{{ @label }}</slot>
      </a>
    </li>
    """
  end
end
