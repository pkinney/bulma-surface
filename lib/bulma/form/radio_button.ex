defmodule Bulma.Form.RadioButton do
  use Bulma.Form.Input

  import Phoenix.HTML.Form, only: [radio_button: 4]

  prop radio_value, :string
  prop label, :string
  prop label_class, :css_class
  prop checked, :boolean

  slot default

  @impl true
  def render(assigns) do
    ~H"""
    <Context get={{ form: form, field: name }}>
      <label class="radio" disabled={{ @disabled }}>
        {{ radio_button(form, name, @value, opts(assigns, form, name)) }}
        <slot>{{ @label }}</slot>
      </label>
    </Context>
    """
  end

  defp opts(assigns, form, field) do
    __MODULE__
    |> put_opts_from_props(assigns, [:value, :checked, :disabled])
    |> put_class_from_props(assigns, "")
    |> put_is_classes(assigns, [:color])
    |> put_invalid_class(form, field)
  end
end
