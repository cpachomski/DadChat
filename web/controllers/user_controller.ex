defmodule Dadchat.UserController do
	use Dadchat.Web, :controller
	alias Dadchat.User

	def new(conn, _params) do
		changeset = User.changeset(%User{})
		render conn, "new.html", changeset: changeset
	end

	def create(conn, %{"user" => user_params}) do
		changeset = User.registration_changeset(%User{}, user_params)
		case Repo.insert(changeset) do
			{:ok, user} ->
				conn
				|> put_flash(:info, "#{user.username} create!")
				|> redirect(to: user_path(conn, :index))
			{:error, changeset} ->
				render(conn, "new.html", changeset: changeset)
		end
	end

	def index(conn, _params) do
		users = Repo.all(User)
		render conn, "index.html", users: users
	end
end