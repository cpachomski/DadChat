defmodule Dadchat.RoomController do
  use Dadchat.Web, :controller

  plug :authenticate_user when action in [:index, :new, :show]

  alias Dadchat.Room

  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
      [ conn, conn.params, conn.assigns.current_user ])
  end

  def index(conn, _params, user) do
    rooms = Repo.all(Room)
    render(conn, "index.html", rooms: rooms)
  end

  def new(conn, _params, user) do
    changeset = Room.changeset(%Room{})
    render(conn, "new.html", changeset: changeset)
  end

end
