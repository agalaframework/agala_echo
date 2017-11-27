defmodule AgalaEcho.VkEchoHandler do
  use Agala.Chain.Builder
  use Agala.Provider.Vk, :handler

  chain Agala.Chain.Loopback
  chain Agala.Provider.Vk.Chain.Parser
  chain :handle

  def handle(conn = %Agala.Conn{
    request_bot_params: %Agala.BotParams{name: name},
    request: request = %{user_id: user_id, text: text, random_id: random_id}
  }, _) do
    case random_id do
      0 ->
        conn
        |> Messages.send(user_id, text)
      _ -> conn |> Agala.Conn.halt()
    end
  end

  def handle(conn = %Agala.Conn{
    request_bot_params: %Agala.BotParams{name: name},
    request: request
  }, _) do
    conn
    |> Agala.Conn.halt()
  end
end
