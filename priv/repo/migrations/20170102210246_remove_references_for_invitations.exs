defmodule Dadchat.Repo.Migrations.RemoveReferencesForInvitations do
  use Ecto.Migration

  def change do
  	alter table(:invitations) do
  		remove :sender
  		remove :invitee
  		remove :room

		add :sender, :integer
		add :invitee, :integer
		add :room, :integer  		
  	end
  end
end
