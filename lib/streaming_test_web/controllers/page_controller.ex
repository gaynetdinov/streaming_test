defmodule StreamingTestWeb.PageController do
  use StreamingTestWeb, :controller

  def index(conn, _params) do
    conn = conn
    |> put_resp_content_type("application/json")
    |> send_chunked(200)

    {:ok, conn} = chunk(conn, "{")
    :timer.sleep(100)
    {:ok, conn} = chunk(conn, "\"key1\"")
    :timer.sleep(100)
    {:ok, conn} = chunk(conn, ":")
    :timer.sleep(100)
    {:ok, conn} = chunk(conn, "\"value1\"")
    :timer.sleep(100)
    {:ok, conn} = chunk(conn, ",")
    :timer.sleep(100)
    {:ok, conn} = chunk(conn, "\"key2\"")
    :timer.sleep(100)
    {:ok, conn} = chunk(conn, ":")
    :timer.sleep(100)
    {:ok, conn} = chunk(conn, "\"value2\"")
    :timer.sleep(100)
    {:ok, conn} = chunk(conn, "}")
    :timer.sleep(100)

    conn
  end
end
