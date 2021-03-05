defmodule Bulma.Components.Pagination.Link do
  use Surface.Component, slot: "list"

  prop class, :css_class
  prop label, :string
  prop click, :event
  prop url, :string
  prop data, :any
  prop current, :boolean

  slot default
end
