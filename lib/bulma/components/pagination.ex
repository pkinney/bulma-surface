defmodule Bulma.Components.Pagination do
  use Surface.Component

  prop centered, :boolean
  prop right, :boolean
  prop rounded, :boolean
  prop size, :string, values: ~w(small medium large)
  prop class, :css_class

  slot default
  slot list

  @impl true
  def render(assigns) do
    ~H"""
    <nav
      class={{
        "pagination",
        @class,
        "is-centered": @centered,
        "is-right": @right,
        "is-rounded": @rounded,
        "is-#{@size}": @size
      }}
      role="navigation"
      aria-label="pagination"
    >
      <slot />
      <ul class="pagination-list">
        <li :for.with_index={{ {item, index} <- @list }}>
          <a
            :if={{ Map.has_key?(item, :url) }}
            href={{ item.url }}
            class={{ "pagination-link", item.class, "is-current": item.current }}
            :on-click={{ item.click }}
            phx-value-data={{ item.data }}
          >
            <slot name="list" index={{ index }} :if={{ !item.label }} />
            {{ item.label }}
          </a>
          <span :if={{ !Map.has_key?(item, :url) }} class={{ "pagination-ellipsis", item.class }}>&hellip;</span>
        </li>
      </ul>
    </nav>
    """
  end
end
