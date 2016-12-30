defmodule Dadchat.Repo.Migrations.CreateRoomsUsers do
  use Ecto.Migration

  def change do
  	create table(:rooms_users, primary_key: false) do
  		add :room_id, references(:users)
  		add :user_id, references(:rooms)
  	end
  end
end
