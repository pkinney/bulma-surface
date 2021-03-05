defmodule Bulma.Form.HiddenInput do
  use Surface.Component
  import Phoenix.HTML.Form, only: [hidden_input: 3]

  prop name, :atom, required: true
  prop value, :string
  prop opts, :keyword, default: []

  @impl true
  def render(assigns) do
    ~H"""
    <Context get={{ form: form }}>
      {{ hidden_input(form, @name, @opts |> add_value(@value, form, @name)) }}
    </Context>
    """
  end

  defp add_value(opts, nil, form, name) do
    case Keyword.has_key?(opts, :value) do
      true -> opts
      false -> opts ++ [value: Map.get(form.data, name)]
    end
  end

  defp add_value(opts, value, _, _) do
    Keyword.delete(opts, :value) ++ [value: value]
  end
end
