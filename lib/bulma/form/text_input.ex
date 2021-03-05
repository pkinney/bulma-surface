defmodule Bulma.Form.TextInput do
  use Bulma.Form.Input

  import Phoenix.HTML.Form, only: [text_input: 3]

  def render(assigns) do
    ~H"""
    <Context get={{ form: form, field: field }}>
      <div class={{
        "control",
        @control_class,
        "has-icons-left": @icon_left,
        "has-icons-right": @icon_right,
        "is-#{@size}": @size,
        "is-loading": @loading
      }}>
        {{ text_input(form, field, opts(assigns, form, field)) }}
        <Bulma.Elements.Icon icon={{ @icon_left }} class="is-left" :if={{ @icon_left }} />
        <Bulma.Elements.Icon icon={{ @icon_right }} class="is-right" :if={{ @icon_right }} />
      </div>
    </Context>
    """
  end

  defp opts(assigns, form, field) do
    __MODULE__
    |> put_opts_from_props(assigns, [:value, :placeholder, :type, :disabled, :readonly])
    |> put_class_from_props(assigns, "input")
    |> put_is_classes(assigns, [:color, :size])
    |> put_bool_classes(assigns, [
      :rounded,
      :hovered,
      :focused,
      :loading,
      :disabled,
      :readonly,
      :static
    ])
    |> put_invalid_class(form, field)
  end
end
