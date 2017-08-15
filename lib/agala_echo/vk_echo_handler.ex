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

  chain :handle

  def handle(conn = %Agala.Conn{
    request_bot_params: %Agala.BotParams{name: name},
    request: request = [4, flags, _, user_id, _, _, text, _, random_id]
  }, _) do
    IO.inspect request
    case random_id do
      0 ->
        conn
        |> send_message(name, user_id, text)
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
