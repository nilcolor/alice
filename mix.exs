defmodule Alice.Mixfile do
  use Mix.Project

  def project do
    [
      app: :alice,
      version: "0.4.1",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: "A Slack bot",
      package: package(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferrred_cli_env: [coveralls: :test],
      docs: [logo: "resources/logo.png"]
    ]
  end

  def application do
    [applications: [:logger, :slack, :mix]]
  end

  defp deps do
    [
      {:credo, "~> 1.2", only: [:dev, :test], runtime: false},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:slack, "~> 0.23.0"},
      {:poolboy, "~> 1.5.0"},
      {:redix, "~> 0.6.0"},
      {:poison, "~> 3.0"},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.12.3", only: :test}
    ]
  end

  defp package do
    [
      files: ["lib", "config", "mix.exs", "README*", ".formatter.exs"],
      maintainers: ["Adam Zaninovich"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/adamzaninovich/alice",
        "Docs" => "http://hexdocs.pm/alice/readme.html"
      }
    ]
  end

  defp elixirc_paths(_), do: ["test/support", "lib"]
end
