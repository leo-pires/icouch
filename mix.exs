
# Created by Patrick Schneider on 03.06.2017.
# Copyright (c) 2017,2018 MeetNow! GmbH

defmodule ICouch.Mixfile do
  use Mix.Project

  def project do
    [app: :icouch,
     name: "ICouch",
     version: "0.6.2",
     elixir: "~> 1.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     source_url: "https://github.com/meetnow/icouch",
     homepage_url: "https://github.com/meetnow/icouch",
     docs: [main: "readme", extras: ["README.md"]],
     description: description(),
     package: package(),
     deps: deps(),
     dialyzer: [plt_add_apps: [:ibrowse, :jason]],
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [coveralls: :test, "coveralls.html": :test, vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test]]
  end

  defp description do
    """
    A CouchDB client for Elixir using ibrowse for HTTP transfer
    """
  end

  def application do
    [extra_applications: [:logger, :ssl]]
  end

  defp deps do
    [
      {:ibrowse, "4.4.0"},
      {:jason, "~> 1.2.2"},
      {:exvcr, "~> 0.12.0", only: :test},
      {:excoveralls, "~> 0.13.3", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.23.0", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [maintainers: ["Patrick Schneider <patrick.schneider@meetnow.eu>"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/meetnow/icouch"}]
  end
end
