defmodule Bulma.Components.Tabs do
  use Surface.LiveComponent

  prop alignment, :string, values: ~w(centered right)
  prop size, :string, values: ~w(small medium large)
  prop boxed, :boolean
  prop fullwidth, :boolean
  prop toggle, :boolean
  prop class, :css_class

  prop starting_tab, :integer, default: 0

  data active_tab, :integer, default: 0

  slot tabs, required: true

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <nav class={{
        "tabs",
        @class,
        "is-boxed": @boxed,
        "is-fullwidth": @fullwidth,
        "is-#{@size}": @size,
        "is-#{@alignment}": @alignment,
        "is-toggle": @toggle
      }}>
        <ul>
          <li :for.with_index={{ {tab, index} <- @tabs }} class={{ "is-active": @active_tab == index }}>
            <a :on-click="click-tab" phx-value-index={{ index }} href="#">
              <Bulma.Elements.Icon icon={{ tab.icon }} :if={{ tab.icon }} size="small" />
              <span>
                {{ tab.label }}
              </span>
            </a>
          </li>
        </ul>
      </nav>
      <section class="tab-content" style="overflow: hidden;">
        <div :for.index={{ index <- @tabs }} :show={{ @active_tab == index }} class="tab-item">
          <slot name="tabs" index={{ index }} />
        </div>
      </section>
    </div>
    """
  end

  @impl true
  def handle_event("click-tab", %{"index" => index_str}, socket) do
    index = String.to_integer(index_str)
    {:noreply, socket |> assign(:active_tab, index)}
  end

  @impl true
  def update(assigns, socket) do
    {:ok, socket |> assign(assigns) |> assign(:active_tab, assigns.starting_tab)}
  end
end
