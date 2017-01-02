defmodule Dadchat.Repo.Migrations.RemoveAndReinsertInvitations do
  use Ecto.Migration

  def change do
  	drop table(:invitations)

  	create table(:invitations) do
  		add :sender_id, :integer
  		add :invitee_id, :integer
  		add :room_id, :integer

  		timestamps()
  	end
  end
end
