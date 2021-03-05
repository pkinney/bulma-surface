defmodule Bulma.Components.Card.FooterItem do
  use Surface.Component, slot: "footer_items"

  prop class, :css_class

  slot default
end
