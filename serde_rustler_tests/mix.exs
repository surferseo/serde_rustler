defmodule SerdeRustlerTests.Mixfile do
  use Mix.Project

  @name :serde_rustler_tests
  @version "0.0.1"
  @description """
  """
  @github "https://github.com/datalove-app/serde_rustler"
  @files ["mix.exs", "mix.lock", "lib", "native", "test", "README.md"]
  @maintainers ["Sunny G"]
  @licenses ["MIT"]

  # ------------------------------------------------------------

  def project do
    in_production = Mix.env() == :prod

    [
      app: @name,
      version: @version,
      description: @description,
      docs: docs(),
      package: package(),
      deps: deps() ++ dev_deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test
      ],
      elixir: "~> 1.15",
      build_embedded: in_production,
      start_permanent: in_production,
      compilers: Mix.compilers()
    ]
  end

  def application do
    [extra_applications: [], applications: [:logger]]
  end

  defp deps do
    [{:rustler, "~> 0.31.0"}]
  end

  defp dev_deps do
    [
      {:jason, "~> 1.1"},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.10", only: [:test]},
      {:ex_doc, "~> 0.19", only: [:dev], runtime: false},
      {:mix_test_watch, "~> 0.8", only: [:dev], runtime: false},
      # JSON serialization libs for benchmarks
      {:benchee, "~> 1.0", only: [:dev]},
      {:benchee_html, "~> 1.0", only: [:dev]},
      {:benchee_markdown, "~> 0.2", only: [:dev]},
      {:exjsx, "~> 4.0", only: [:dev]},
      {:jiffy, "~> 1.0", only: [:dev]},
      {:json, "~> 1.3", only: [:dev]},
      {:jsone, "~> 1.4", only: [:dev]},
      {:poison, "~> 4.0", only: [:dev, :test]},
      {:tiny, "~> 1.0", only: [:dev]}
    ]
  end

  defp package do
    [
      name: @name,
      files: @files,
      maintainers: @maintainers,
      licenses: @licenses,
      links: %{
        "GitHub" => @github
      }
    ]
  end

  defp docs do
    [main: "readme", source_url: @github, extras: ["README.md"]]
  end
end
