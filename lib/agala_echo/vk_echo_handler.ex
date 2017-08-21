defmodule AgalaEcho.VkEchoHandler do
  # def handle(conn = %Agala.Conn{request: message}, bot_params) do
  #   IO.inspect "Message in handler:\n #{inspect(message)}"
  #   Map.put(conn, :response, %Agala.Response{
  #     name: bot_params.name,
  #     method: :noaction
  #   })
  # end
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
