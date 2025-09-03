defmodule Itsm.MixProject do
  use Mix.Project

  def project do
    [
      app: :itsm,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Itsm.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:heroicons,
       github: "tailwindlabs/heroicons",
       tag: "v2.1.1",
       sparse: "optimized",
       app: false,
       compile: false,
       depth: 1},
      {:bandit, "== 1.7.0"},
      {:castore, "== 1.0.14"},
      {:db_connection, "== 2.8.0"},
      {:decimal, "== 2.3.0"},
      {:dns_cluster, "== 0.1.3"},
      {:ecto, "== 3.13.2"},
      {:ecto_sql, "== 3.13.2"},
      {:esbuild, "== 0.10.0", runtime: Mix.env() == :dev},
      {:expo, "== 1.1.0"},
      {:file_system, "== 1.1.0"},
      {:finch, "== 0.20.0"},
      {:floki, "== 0.38.0", only: :test},
      {:gettext, "== 0.26.2"},
      {:hpax, "== 1.0.3"},
      {:jason, "== 1.4.4"},
      {:mime, "== 2.0.7"},
      {:mint, "== 1.7.1"},
      {:nimble_options, "== 1.1.1"},
      {:nimble_pool, "== 1.1.0"},
      {:phoenix, "== 1.7.21"},
      {:phoenix_ecto, "== 4.6.5"},
      {:phoenix_html, "== 4.2.1"},
      {:phoenix_live_dashboard, "== 0.8.7"},
      {:phoenix_live_reload, "== 1.6.0", only: :dev},
      {:phoenix_live_view, "== 1.0.17"},
      {:phoenix_pubsub, "== 2.1.3"},
      {:phoenix_template, "== 1.0.4"},
      {:plug, "== 1.18.1"},
      {:plug_crypto, "== 2.1.1"},
      {:postgrex, "== 0.20.0"},
      {:swoosh, "== 1.19.3"},
      {:tailwind, "== 0.2.4", runtime: Mix.env() == :dev},
      {:telemetry, "== 1.3.0"},
      {:telemetry_metrics, "== 1.1.0"},
      {:telemetry_poller, "== 1.3.0"},
      {:thousand_island, "== 1.3.14"},
      {:websock, "== 0.5.3"},
      {:websock_adapter, "== 0.5.8"},
      {:comeonin, "== 5.5.1"},
      {:pbkdf2_elixir, "== 2.3.1"},
      # Samly
      {:samly, "== 1.4.0"},
      {:cowboy, "== 2.13.0"},
      {:cowlib, "== 2.15.0"},
      {:esaml, "== 4.6.0"},
      {:ranch, "== 2.2.0"},
      {:sweet_xml, "== 0.7.5"},
      # Logger_file_backend
      {:logger_file_backend, "== 0.0.14"},
      # nimble_totp
      {:nimble_totp, "== 1.0.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "assets.setup", "assets.build"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": ["tailwind itsm", "esbuild itsm"],
      "assets.deploy": [
        "tailwind itsm --minify",
        "esbuild itsm --minify",
        "phx.digest"
      ]
    ]
  end
end
