defmodule Dadchat.Repo.Migrations.FixInvitationRoomIdColumn do
  use Ecto.Migration

  def change do
  	alter table(:invitations) do
  		remove :room_id
  		add :room, references(:rooms, on_delete: :delete_all)
  	end
  end
end
