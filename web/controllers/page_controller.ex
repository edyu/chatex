defmodule Chatex.PageController do
  use Chatex.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
