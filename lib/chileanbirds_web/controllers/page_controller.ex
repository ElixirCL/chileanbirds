defmodule ChileanbirdsWeb.PageController do
  use ChileanbirdsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
