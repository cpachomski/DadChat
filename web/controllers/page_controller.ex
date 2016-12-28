defmodule Dadchat.PageController do
  use Dadchat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
