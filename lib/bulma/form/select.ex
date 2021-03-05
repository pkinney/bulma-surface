defmodule Bulma.Form.Select do
  use Bulma.Form.Input

  import Phoenix.HTML.Form, only: [select: 4]
  prop options, :list, default: []

  @impl true
  def render(assigns) do
    ~H"""
    <Context get={{ form: form, field: field }}>
      <div class={{ "control", "has-icons-left": @icon_left }}>
        <div class={{ "select", "is-#{@size}": @size, "is-loading": @loading }}>
          {{ select(form, field, @options, opts(assigns, form, field)) }}
          <Bulma.Elements.Icon icon={{ @icon_left }} class="is-left" :if={{ @icon_left }} />
        </div>
      </div>
    </Context>
    """
  end

  defp opts(assigns, form, field) do
    __MODULE__
    |> put_opts_from_props(assigns, [:value, :placeholder])
    |> put_class_from_props(assigns, "input")
    |> put_is_classes(assigns, [:color])
    |> put_bool_classes(assigns, [:rounded, :hovered, :focused, :loading, :disabled])
    |> put_invalid_class(form, field)
  end
end
