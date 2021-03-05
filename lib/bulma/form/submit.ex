defmodule Bulma.Form.Submit do
  use Bulma.Form.Input

  import Phoenix.HTML.Form, only: [submit: 2]

  prop label, :string

  slot default

  def render(assigns) do
    ~H"""
    {{ submit(opts(assigns), do: ~H"<slot>{{ @label }}</slot>") }}
    """
  end

  defp opts(assigns) do
    __MODULE__
    |> put_opts_from_props(assigns, [:value])
    |> put_class_from_props(assigns, "button")
    |> put_is_classes(assigns, [:color])
  end
end
