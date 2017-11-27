defmodule AgalaEcho.Mixfile do
  use Mix.Project

  def project do
    [app: :agala_echo,
     version: "0.1.0",
     elixir: "~> 1.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :agala_vk, :agala_telegram],
     mod: {AgalaEcho.Application, []}]
  end

  defp deps do
    [
      {:agala_telegram, "~> 0.1.0"},
      {:agala_vk, "~> 0.1.0"}
    ]
  end
end
