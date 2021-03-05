defmodule Bulma.Components.Card.FooterLink do
  use Surface.Component, slot: "footer_items"

  prop label, :string
  prop url, :string
  prop click, :event
  prop confirm, :string
  prop color, :string, values: Bulma.Helpers.Color.text_colors()
  prop icon, :string, values: Bulma.Helpers.Icons.all_icons()
  prop class, :css_class
end
