defmodule Dadchat.Repo.Migrations.RemoveRoomsUsers do
  use Ecto.Migration

  def change do
  	drop table(:rooms_users)
  end
end
