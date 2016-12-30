defmodule Dadchat.Repo.Migrations.CreateRoomsUsers do
  use Ecto.Migration

  def change do
  	create table(:rooms_users) do
  		add :room_id, references(:rooms, on_delete: :delete_all)
  		add :user_id, references(:users, on_delete: :delete_all)
  		
  		timestamps
  	end
  end
end
