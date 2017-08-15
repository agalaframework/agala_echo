defmodule AgalaEcho.TelegramEchoHandler do
  use Agala.Chain.Builder
  use Agala.Provider.Telegram, :handler

  chain :handle

  def handle(conn = %Agala.Conn{
    request_bot_params: %Agala.BotParams{name: name},
    request: %{"message" => %{"text" => text, "chat" => %{"id" => id}}}
  }, _) do
    conn
    |> send_message(name, id, text)
  end
end
