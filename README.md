# Bulma

A one-to-one implementation of the [Bulma](https://bulma.io) framework on the [Surface](http://github.com/msaraiva/surface) component system for Phoenix LiveView.

## Installation

1. Follow the Surface [Getting Started](http://surface-demo.msaraiva.io/getting_started) instructions.
2. Replace `Phoenix.LiveView` with `Surface.LiveView` in your app's `MyAppWeb` module (optionally, replace `Phoenix.LiveComponent` with `Surface.LiveComponent`):

```elixir
def live_view do
  quote do
    use Surface.LiveView,
      layout: {MyAppWeb.LayoutView, "live.html"}

    unquote(view_helpers())
  end
end
```

3. Add bulma, fontawesome, and file-loader to your assets: `cd assets && yarn add bulma @fortawesome/fontawesome-free file-loader`.
4. Import bulma into your project's `assets/css/app.scss` and remove `pheonix.css`:

```scss
@import "../node_modules/bulma/css/bulma.min.css";
@import "../node_modules/@fortawesome/fontawesome-free/css/all.css";
// Remove this: @import "./phoenix.css"
```

4. Add bulma_surface to your project's `deps`

```elixir
def deps do
  [
    {:bulma_surface, "~> 0.1.0"}
  ]
end
```

5. If you installed fontawesome, you have to configure Webpack to handle the SVGs correctly.  Add the following to the `rules` in your `assets/webpack.config.js` file:

```javascript
{
  test: /\.(woff(2)?|ttf|eot|svg)(\?v=\d+\.\d+\.\d+)?$/,
  use: [{
    loader: 'file-loader',
    options: {
      name: '[name].[ext]',
      outputPath: '../fonts'
    }
  }]
}
```

5. Include `Bulma` in the `view_helpers` function in your app's `MyAppWeb` module.

```elixir
defp view_helpers do
  quote do
    ...
    use Bulma 
  end
end
``` 

## Usage

The Bulma components are (where possible) named as they are in Bulma's documentation.  Additionally, all of the component classes (i.e. `is-rounded`, `is-light`, etc.) are boolean where possible.

```elixir
defmodule MyAppWeb.PageLive do
  use MyAppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(%{value: 42})}
  end

  @impl true
  def render(assigns) do
    ~H"""
      <Hero color="info" size="medium">
        <Container>
          <Title size=1>Hello Bulma!</Title>
          <Subtitle size=3>Congratulations! You're running Bulma in Surface.</Subtitle>
        </Container>
      </Hero>
      <Section>
        <Container>
          <Columns>
            <Column size="one-third">
              <Title size=2>Bulma Surface</Title>
              <Content>
                <Text>Here's a progress bar:</Text>
              </Content>
            </Column>
            <Column>
              <Box>
                <ProgressBar color="primary" value={{ @value }} max=100 size="large" />
                <Buttons addons alignment="right">
                  <Button label="One" click="reset" />
                  <Button label="Two" click="middle" color="primary" />
                  <Button color="danger" click="finish">Three</Button>
                </Buttons>
              </Box>
            </Column>
          </Columns>
        </Container>
      </Section>
    """
  end

  @impl true
  def handle_event("reset", _, socket), do: {:noreply, socket |> assign(%{value: 10})}
  def handle_event("middle", _, socket), do: {:noreply, socket |> assign(%{value: nil})}
  def handle_event("finish", _, socket), do: {:noreply, socket |> assign(%{value: 100})}
end
```

## Progress

 * Layout
   * [X] Columns/Column
   * [X] Container
   * [X] Hero
   * [X] Level
   * [X] Media
   * [X] Section
   * [X] Footer
   * [X] Tiles
 * Form
   * [X] Checkbox
   * [X] Field
   * [X] Hidden Input
   * [X] Multiple Select
   * [X] Radio
   * [X] Select
   * [X] Submit
   * [X] Text Input
   * [X] Textarea
 * Elements
   * [X] Block
   * [X] Box
   * [X] Button
   * [X] Buttons
   * [X] Content
   * [X] Delete
   * [X] Icon
   * [X] Icon Text
   * [X] Image
   * [X] Notification
   * [X] ProgressBar
   * [X] Table
   * [X] Tag
   * [X] Tags
   * [X] Title/Subtitle
 * Components
   * [X] Breadcrumb
   * [X] Card
   * [X] Dropdown
   * [X] Menu
   * [X] Message
   * [X] Modal
   * [X] Navbar
   * [X] Pagination
   * [X] Panel
   * [X] Tabs

