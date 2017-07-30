defmodule AgalaEcho.EchoHandler do
  use Agala.Provider.Telegram, :handler

  def handle(conn = %Agala.Conn{request: %{"message" => %{"text" => text, "chat" => %{"id" => id}}}}, bot_params) do
    conn
    |> send_message(bot_params.name, id, text)
  end
end
