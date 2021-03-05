defmodule Bulma.Form.Checkbox do
  use Bulma.Form.Input

  import Phoenix.HTML.Form, only: [checkbox: 3]

  prop checked_value, :string, default: "true"
  prop unchecked_value, :string, default: "false"

  prop label, :string
  prop name, :atom, required: true

  slot default

  def render(assigns) do
    ~H"""
    <Context get={{ form: form }}>
      <div class="field">
        <div class="control">
          <label class="checkbox" disabled={{ @disabled }}>
            {{ checkbox(form, @name, opts(assigns, form, @name)) }}
            <slot>{{ @label }}</slot>
          </label>
        </div>
      </div>
    </Context>
    """
  end

  defp opts(assigns, form, field) do
    __MODULE__
    |> put_opts_from_props(assigns, [:value, :checked_value, :unchecked_value, :disabled])
    |> put_class_from_props(assigns, "")
    |> put_is_classes(assigns, [:color])
    |> put_invalid_class(form, field)
  end
end
