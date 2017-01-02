defmodule Dadchat.InvitationController do
  use Dadchat.Web, :controller
  require Logger

  alias Dadchat.Invitation
  alias Dadchat.Assoc

  def index(conn, _params) do
    invitations = Repo.all(Invitation)
    render(conn, "index.json", invitations: invitations)
  end

  def create(conn, %{"invitation" => invitation_params}) do
    changeset = Invitation.changeset(%Invitation{}, invitation_params)
    Logger.debug "#{inspect(invitation_params)}"
    case Repo.insert(changeset) do
      {:ok, invitation} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", invitation_path(conn, :show, invitation))
        |> render("show.json", invitation: invitation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Dadchat.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    invitation = Repo.get!(Invitation, id)
    render(conn, "show.json", invitation: invitation)
  end

  def update(conn, %{"id" => id, "invitation" => invitation_params}) do
    invitation = Repo.get!(Invitation, id)
    changeset = Invitation.changeset(invitation, invitation_params)

    case Repo.update(changeset) do
      {:ok, invitation} ->
        render(conn, "show.json", invitation: invitation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Dadchat.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    invitation = Repo.get!(Invitation, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(invitation)

    send_resp(conn, :no_content, "")
  end
end
