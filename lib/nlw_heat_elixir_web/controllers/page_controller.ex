defmodule NlwHeatElixirWeb.PageController do
  use NlwHeatElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
