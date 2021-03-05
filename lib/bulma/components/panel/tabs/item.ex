defmodule Bulma.Components.Panel.Tabs.Item do
  use Surface.Component, slot: "panel_tabs"

  prop label, :string, required: true
  prop icon, :string, values: Bulma.Helpers.Icons.all_icons()
end
