defmodule Dadchat.RoomController do
  use Dadchat.Web, :controller

  plug :authenticate_user when action in [:index, :new, :show]

  alias Dadchat.Room

  def index(conn, _params) do
    rooms = Repo.all(Room)
    render(conn, "index.html", rooms: rooms)
  end

  def new(conn, _params) do
    changeset = Room.changeset(%Room{})
    render(conn, "new.html", changeset: changeset)
  end


end
