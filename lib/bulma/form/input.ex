defmodule Bulma.Form.Input do
  defmacro __using__(_) do
    quote do
      use Surface.Component

      alias Bulma.Form.Input.InputContext

      import Bulma.Form.Utils

      prop form, :form
      prop field, :atom
      prop value, :string
      prop class, :css_class

      prop size, :string, values: ["small", "normal", "medium", "large"]
      prop color, :string, values: Bulma.Helpers.Color.colors()
      prop placeholder, :string
      prop type, :string
      prop opts, :keyword, default: []

      prop rounded, :boolean
      prop hovered, :boolean
      prop focused, :boolean
      prop loading, :boolean
      prop disabled, :boolean
      prop readonly, :boolean
      prop static, :boolean

      prop control_class, :css_class
      prop icon_left, :string, values: Bulma.Helpers.Icons.all_icons()
      prop icon_right, :string, values: Bulma.Helpers.Icons.all_icons()

      prop blur, :event
      prop focus, :event
      prop capture_click, :event
      prop keydown, :event
      prop keyup, :event

      def prop_to_opts(value, key), do: Surface.prop_to_opts(value, key)
    end
  end
end
