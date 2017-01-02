defmodule Dadchat.InvitationView do
  use Dadchat.Web, :view

  def render("index.json", %{invitations: invitations}) do
    %{data: render_many(invitations, Dadchat.InvitationView, "invitation.json")}
  end

  def render("show.json", %{invitation: invitation}) do
    %{data: render_one(invitation, Dadchat.InvitationView, "invitation.json")}
  end

  def render("invitation.json", %{invitation: invitation}) do
    %{id: invitation.id,
      sender: invitation.sender,
      invitee: invitation.invitee,
      room: invitation.room}
  end
end
