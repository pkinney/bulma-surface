defmodule Bulma.Components.Card do
  use Surface.Component

  prop class, :css_class

  slot default
  slot header
  slot image
  slot footer_items

  @impl true
  def render(assigns) do
    ~H"""
    <div class={{ "card", @class }}>
      <div class="card-image" :if={{ slot_assigned?(:image) }}>
        <slot name="image" />
      </div>
      <div class="card-header" :if={{ slot_assigned?(:header) }}>
        <slot name="header" />
      </div>
      <div class="card-content"><slot /></div>
      <div class="card-footer" :if={{ slot_assigned?(:footer_items) }}>
        <div class="card-footer-item" :for.with_index={{ {item, index} <- @footer_items }}>
          <a
            :if={{ Map.has_key?(item, :url) }}
            href={{ item.url }}
            class={{ item.class }}
            :on-click={{ item.click }}
            data-confirm="{{ item.confirm }}"
          >
            <Bulma.Elements.Icon icon={{ item.icon }} :if={{ item.icon }} />
            {{ item.label }}
          </a>
          <slot
            name="footer_items"
            index={{ index }}
            class={{ item.class }}
            :if={{ !Map.has_key?(item, :url) }}
          />
        </div>
      </div>
    </div>
    """
  end
end
