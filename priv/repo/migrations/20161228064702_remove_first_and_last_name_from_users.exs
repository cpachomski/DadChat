defmodule Dadchat.Repo.Migrations.RemoveFirstAndLastNameFromUsers do
  use Ecto.Migration

  def change do
  	alter table(:users) do
  		remove :first_name
  		remove :last_name
  	end
  end
end
