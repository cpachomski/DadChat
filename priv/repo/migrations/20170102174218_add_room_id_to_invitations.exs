defmodule Dadchat.Repo.Migrations.AddRoomIdToInvitations do
  use Ecto.Migration

  def change do
  	alter table(:invitations) do
  		add :room_id, references(:rooms, on_delete: :delete_all)	
  	end
  end
end
