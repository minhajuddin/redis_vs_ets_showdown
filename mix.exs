defmodule RedisVsEtsShowdown.Mixfile do
  use Mix.Project

  def project do
    [
      app: :redis_vs_ets_showdown,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RedisVsEtsShowdown.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:benchee, ">0.0.0"},
      {:redix, ">0.0.0"},
      {:benchee_html, ">0.0.0"},
    ]
  end
end
