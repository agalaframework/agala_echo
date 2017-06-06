defmodule AgalaEcho.Mixfile do
  use Mix.Project

  def project do
    [app: :agala_echo,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :agala],
     mod: {AgalaEcho.Application, []}]
  end

  defp deps do
    [
      {:agala, github: "virviil/agala", branch: "develop"}
    ]
  end
end
