defmodule Bulma.Form.RadioField do
  use Surface.Component

  import Phoenix.HTML.Tag, only: [content_tag: 3]

  prop name, :atom, required: true
  prop class, :css_class, default: ""

  slot default, required: true

  def render(assigns) do
    ~H"""
    <div class={{ "field", @class }}>
      <Context get={{ form: form }}>
        <Context put={{ field: @name, form: form }}>
          <slot />
        </Context>
        {{ if form do
          error_tag(form, @name)
        end }}
      </Context>
    </div>
    """
  end

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
