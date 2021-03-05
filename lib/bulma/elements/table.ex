defmodule Bulma.Elements.Table do
  use Surface.Component

  prop data, :list, required: true

  prop class, :css_class
  prop bordered, :boolean, default: false
  prop striped, :boolean, default: false
  prop narrow, :boolean, default: false
  prop hoverable, :boolean, default: false
  prop fullwidth, :boolean, default: false
  prop no_heading, :boolean, default: false
  prop heading_class, :css_class

  slot columns, props: [item: ^data], required: true

  @impl true
  def render(assigns) do
    ~H"""
    <table class={{
      "table",
      "#{@class}": @class,
      "is-bordered": @bordered,
      "is-striped": @striped,
      "is-narrow": @narrow,
      "is-hoverable": @hoverable,
      "is-fullwidth": @fullwidth
    }}>
      <thead :if={{ !@no_heading }}>
        <tr>
          <th
            :for={{ column <- @columns }}
            class={{
              @heading_class,
              "#{column.heading_class}": column.heading_class
            }}
          >
            {{ column.label }}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr :for={{ item <- @data }}>
          <td
            :for.with_index={{ {column, index} <- @columns }}
            class={{ column.class }}
            style={{if column.width_style do
              "width: #{column.width_style};"
            else
              ""
            end}}
          >
            <slot name="columns" index={{ index }} :props={{ item: item }} />
          </td>
        </tr>
      </tbody>
    </table>
    """
  end
end
