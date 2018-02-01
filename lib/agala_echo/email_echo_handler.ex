defmodule AgalaEcho.EmailEchoHandler do
  require Logger
  use Agala.Chain.Builder

  chain Agala.Chain.Loopback
  chain :handle

  def handle(conn, a) do
    Logger.warn(fn -> "Unhandled message!" end)
    Logger.warn(fn -> inspect conn end)
    Logger.warn(fn -> inspect a end)
    conn |> Agala.Conn.halt()
  end
end
