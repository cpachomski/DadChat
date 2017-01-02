defmodule Dadchat.Repo.Migrations.GodIHateThis do
  use Ecto.Migration

	def change do
		drop table(:invitations)

		create table(:invitations) do
			add :sender, :integer
			add :invitee, :integer
			add :room, :integer

			timestamps()
		end
	end
end
