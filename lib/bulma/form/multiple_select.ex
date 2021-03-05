defmodule Bulma.Form.MultipleSelect do
  use Bulma.Form.Input

  import Phoenix.HTML.Form, only: [multiple_select: 4]
  prop options, :list, default: []

  @impl true
  def render(assigns) do
    ~H"""
    <Context get={{ form: form, field: field }}>
      <div class={{ "control", "has-icons-left": @icon_left, "has-icons-right": @icon_right }}>
        <div class="select is-multiple">
          {{ multiple_select(form, field, @options, opts(assigns, form, field)) }}
          <Bulma.Elements.Icon icon={{ @icon_left }} class="is-left" :if={{ @icon_left }} />
          <Bulma.Elements.Icon icon={{ @icon_right }} class="is-right" :if={{ @icon_right }} />
        </div>
      </div>
    </Context>
    """
  end

  defp opts(assigns, form, field) do
    __MODULE__
    |> put_opts_from_props(assigns, [:value, :placeholder, :size])
    |> put_class_from_props(assigns, "input")
    |> put_is_classes(assigns, [:color])
    |> put_invalid_class(form, field)
  end
end
