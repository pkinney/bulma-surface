defmodule Bulma.Form do
  use Surface.Component

  import Phoenix.HTML.Form
  alias Surface.Components.Raw

  prop for, :any, required: true
  prop action, :string, default: "#"
  prop as, :atom
  prop method, :string, default: "post"
  prop multipart, :boolean, default: false

  prop buttons_class, :css_class

  prop csrf_token, :any

  prop opts, :keyword, default: []

  prop change, :event
  prop submit, :event

  slot default, required: true, props: [:form]
  slot buttons

  def render(assigns) do
    ~H"""
    {{ form = form_for(@for, @action, opts(assigns)) }}
    <Context put={{ form: form }}>
      <slot />

      <div class="clearfix">
        <div class={{ @buttons_class }} :if={{ slot_assigned?(:buttons) }}>
          <slot name="buttons" />
        </div>
      </div>
    </Context>
    <#Raw></form></#Raw>
    """
  end

  defp opts(assigns) do
    opts =
      [:as, :method, :multipart, :csrf_token, :errors]
      |> Enum.map(&Bulma.Form.Utils.get_opts_from_props(__MODULE__, assigns, &1))

    event_opts = [
      Surface.event_to_opts(assigns.change, :phx_change),
      Surface.event_to_opts(assigns.submit, :phx_submit)
    ]

    (opts ++ event_opts ++ assigns[:opts]) |> List.flatten()
  end

  def prop_to_opts(value, key), do: Surface.prop_to_opts(value, key)
end
