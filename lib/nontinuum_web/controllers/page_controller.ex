defmodule NontinuumWeb.PageController do
  use NontinuumWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
