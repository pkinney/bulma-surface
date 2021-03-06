defmodule Bulma.MixProject do
  use Mix.Project

  def project do
    [
      app: :bulma_surface,
      version: "0.3.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:surface, "~> 0.3.0"}
    ]
  end
end
