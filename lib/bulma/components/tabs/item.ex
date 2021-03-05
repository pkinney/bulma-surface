defmodule Bulma.Components.Tabs.Item do
  use Surface.Component, slot: "tabs"

  prop label, :string, required: true
  prop icon, :string, values: Bulma.Helpers.Icons.all_icons()
end
