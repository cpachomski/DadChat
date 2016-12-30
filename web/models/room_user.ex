defmodule Dadchat.RoomUser do
	use Dadchat.Web, :model

	schema "rooms_users" do
		belongs_to :room, Dadchat.Room
		belongs_to :user, Dadchat.User

		timestamps
	end
	

	def changeset(model, params \\ %{}) do
		model 
		|> cast(params, [])
	end
end