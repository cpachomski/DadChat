defmodule Dadchat.RoomController do
  use Dadchat.Web, :controller
  alias Dadchat.InvitationView
  alias Dadchat.Room
  alias Dadchat.Invitation
  alias Dadchat.Assoc

  require Logger

  plug :authenticate_user when action in [:index, :new, :show]

  alias Dadchat.Room

  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
      [ conn, conn.params, conn.assigns.current_user ])
  end

  def index(conn, _params, user) do
    rooms = Repo.all(user_rooms(user))
    invites = Repo.all(user_invitations(user))
    
    Logger.warn "HEY SHIT #{inspect(invites)}"
    render(conn, "index.html", rooms: rooms, invites: invites)
  end

  def new(conn, _params, user) do
    changeset =
      user
      |> build_assoc(:rooms)
      |> Room.changeset()

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"room" => room_params}, user) do
    changeset = Room.changeset(%Room{}, room_params)

    case Repo.insert(changeset) do
      {:ok, room} ->
        Assoc.room_to_user(room.id, user.id)

        conn
        |> put_flash(:info, "New chat created!")
        |> redirect(to: room_path(conn, :show, room))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, user) do
    room = Repo.get!(Room, id) |> Repo.preload(:users)
    render(conn, "show.html", room: room, user: user)
  end


  defp user_rooms(user) do
    assoc(user, :rooms)
  end

  defp user_invitations(user) do
    q = from i in "invitations", 
          where: i.invitee == ^user.id,
          select: %{invitee: i.invitee, sender: i.sender, room: i.room}
  end
end
