defmodule Bulma.Form.Textarea do
  use Bulma.Form.Input

  import Phoenix.HTML.Form, only: [textarea: 3]

  prop rows, :integer
  prop fixed_size, :boolean

  def render(assigns) do
    ~H"""
    <Context get={{ form: form, field: field }}>
      <div class={{ "control", @control_class, "is-#{@size}": @size, "is-loading": @loading }}>
        {{ textarea(form, field, opts(assigns, form, field)) }}
      </div>
    </Context>
    """
  end

  defp opts(assigns, form, field) do
    __MODULE__
    |> put_opts_from_props(assigns, [:value, :placeholder, :rows, :disabled, :readonly])
    |> put_class_from_props(assigns, "textarea")
    |> put_is_classes(assigns, [:color, :size])
    |> put_bool_classes(assigns, [:hovered, :focused, :loading, :disabled, :readonly])
    |> put_bool_classes(assigns, [:fixed_size], "has")
    |> put_invalid_class(form, field)
  end
end
