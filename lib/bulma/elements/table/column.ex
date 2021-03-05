defmodule Bulma.Elements.Table.Column do
  use Surface.Component, slot: "columns"

  prop label, :string
  prop width_style, :string

  prop class, :css_class
  prop heading_class, :css_class
end
