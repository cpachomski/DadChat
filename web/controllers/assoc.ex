defmodule Dadchat.Assoc do
	use Dadchat.Web, :controller
	alias Dadchat.User
	alias Dadchat.Room
	alias Dadchat.Invitation

	def room_to_user(room_id, user_id) do
		user = Repo.get_by(User, id: user_id) |> Repo.preload(:rooms)
		room = Repo.get_by(Room, id: room_id) |> Repo.preload(:users)

		room_id_list = user.rooms
			|> Enum.map(fn x -> x.id end)
			|> List.insert_at(0, room.id)

		changeset_list = from(room in Room, where: room.id in ^room_id_list)
			|> Repo.all
			|> Enum.map(&Ecto.Changeset.change/1)

		from(user in User, where: user.id == ^user.id, preload: [:rooms])
		|> Repo.one
		|> User.changeset(%{})
		|> Ecto.Changeset.put_assoc(:rooms, changeset_list)
		|> Repo.update!
	end
end