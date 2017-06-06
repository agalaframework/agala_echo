defmodule AgalaEcho.Application do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Add here as many bot instances as you want. Dont forget to name there uniqly.
    children = [
      supervisor(Agala.Bot, [bot_configuration()])
    ]

    opts = [strategy: :one_for_one, name: AgalaEcho.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def bot_configuration do
    %Agala.BotParams{
      name: "agala_echo",
      provider: Agala.Provider.Telegram,
      handler: AgalaEcho.EchoHandler,
      provider_params: %{
        token: "%PUT_YOUR_TOKEN_HERE%",
        poll_timeout: :infinity
      }
    }
  end
end
