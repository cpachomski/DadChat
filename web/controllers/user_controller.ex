defmodule Dadchat.UserController do
	use Dadchat.Web, :controller
	alias Dadchat.User

	def new(conn, _params) do
		changeset = User.changeset(%User{})
		render conn, "new.html", changeset: changeset
	end

	def create(conn, %{"user" => user_params}) do
		changeset = User.changeset(%User{}, user_params)
		{:ok, user} = Repo.insert(changeset)

		conn
		|> put_flash(:info, "#{user.username} create!")
		|> redirect(to: user_path(conn, :index))
	end

	def index(conn, _params) do
		users = Repo.all(User)
		render conn, "index.html", users: users
	end
end