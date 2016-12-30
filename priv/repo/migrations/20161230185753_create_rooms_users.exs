defmodule Dadchat.Repo.Migrations.CreateRoomsUsers do
  use Ecto.Migration

  def change do
  	create table(:rooms_users) do
  		add :room_id, references(:rooms)
  		add :user_id, references(:users)
  		
  		timestamps
  	end
  end
end
