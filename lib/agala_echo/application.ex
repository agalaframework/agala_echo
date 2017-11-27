defmodule AgalaEcho.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Add here as many bot instances as you want. Dont forget to name there uniqly.
    children = [
      supervisor(Agala.Bot, [telegram_bot_configuration()], id: :telegram),
      # supervisor(Agala.Bot, [vk_bot_configuration()], id: :vk)
    ]

    opts = [strategy: :one_for_one, name: AgalaEcho.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def telegram_bot_configuration do
    %Agala.BotParams{
      name: "agala_echo_telegram",
      provider: Agala.Provider.Telegram,
      handler: AgalaEcho.TelegramEchoHandler,
      provider_params: %Agala.Provider.Telegram.Conn.ProviderParams{
        token: System.get_env("TELEGRAM_TOKEN"),
        poll_timeout: :infinity
      }
    }
  end

  # def vk_bot_configuration do
  #   %Agala.BotParams{
  #     name: "agala_echo_vk",
  #     provider: Agala.Provider.Vk,
  #     handler: AgalaEcho.VkEchoHandler,
  #     provider_params: %Agala.Provider.Vk.Conn.ProviderParams{
  #       token: System.get_env("VK_TOKEN"),
  #       poll_timeout: :infinity
  #     }
  #   }
  # end
end
