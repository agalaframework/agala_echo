defmodule AgalaEcho.TelegramEchoHandler do
  require Logger
  use Agala.Chain.Builder
  use Agala.Provider.Telegram, :handler

  chain Agala.Chain.Loopback
  chain :handle

  def handle(conn = %Agala.Conn{
    request: %{"message" => %{"text" => text, "chat" => %{"id" => id}}}
  }, _) do
    conn
    |> send_message(id, text)
  end
  def handle(conn, _) do
    Logger.warn(fn -> "Unhandled message!" end)
    Logger.warn(fn -> inspect conn end)
    conn |> Agala.Conn.halt()
  end
end
