defmodule Bulma.Components.Panel.Tabs do
  use Surface.LiveComponent

  prop class, :css_class
  prop starting_tab, :integer, default: 0

  data active_tab, :integer, default: 0

  slot panel_tabs, required: true

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p class={{ "panel-tabs", @class }}>
        <a
          :for.with_index={{ {tab, index} <- @panel_tabs }}
          class={{ "is-active": @active_tab == index }}
          :on-click="click-tab"
          phx-value-index={{ index }}
          href="#"
        >
          <Bulma.Elements.Icon icon={{ tab.icon }} :if={{ tab.icon }} size="small" />
          <span>
            {{ tab.label }}
          </span>
        </a>
      </p>
      <div :for.index={{ index <- @panel_tabs }} :show={{ @active_tab == index }}>
        <slot name="panel_tabs" index={{ index }} />
      </div>
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
