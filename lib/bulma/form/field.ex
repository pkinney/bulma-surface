defmodule Bulma.Form.Field do
  use Surface.Component

  import Phoenix.HTML.Form, only: [label: 4]
  import Phoenix.HTML.Tag, only: [content_tag: 3]

  prop name, :atom, required: true
  prop label, :string
  prop class, :css_class, default: ""
  prop label_class, :css_class
  prop hide_label, :boolean, default: false
  prop grouped, :boolean

  slot default, required: true

  def render(assigns) do
    ~H"""
    <div class={{ "field", @class, "is-grouped": @grouped }}>
      <Context get={{ form: form }}>
        {{ if !@hide_label do
          label(form, @name, @label || @name, class: "label " <> @class)
        end }}
        <Context put={{ field: @name, form: form }}>
          <slot />
        </Context>
        {{ error_tag(form, @name) }}
      </Context>
    </div>
    """
  end

  defp error_tag(nil, _), do: ""

  defp error_tag(form, name) do
    Enum.map(Keyword.get_values(form.errors, name), fn {msg, opts} ->
      error =
        Enum.reduce(opts, msg, fn {key, value}, acc ->
          String.replace(acc, "%{#{key}}", to_string(value))
        end)

      content_tag(:p, error, class: "help is-danger")
    end)
  end
end
