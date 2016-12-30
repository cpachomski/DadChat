defmodule Dadchat.Repo.Migrations.AddUserTypeToUser do
  use Ecto.Migration

  def change do
  	alter table(:users) do
  		add :type, :string
  	end
  end
end
