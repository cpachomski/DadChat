defmodule Dadchat.UserController do
	use Dadchat.Web, :controller
	alias Dadchat.User

	plug :authenticate_user when action in [:index, :edit]

	def new(conn, _params) do
		changeset = User.changeset(%User{})
		render conn, "new.html", changeset: changeset
	end

	def create(conn, %{"user" => user_params}) do
		changeset = User.registration_changeset(%User{}, user_params)
		case Repo.insert(changeset) do
			{:ok, user} ->
				conn
				|> Dadchat.Auth.login(user)
				|> put_flash(:info, "#{user.username} create!")
				|> redirect(to: room_path(conn, :index))
			{:error, changeset} ->
				render(conn, "new.html", changeset: changeset)
		end
	end

	def index(conn, _params) do
		users = Repo.all(User)
		render conn, "index.html", users: users
	end

	def edit(conn, %{"id" => id}) do

		if to_string(conn.assigns.current_user.id) === to_string(id) do
			user = Repo.get!(User, id)
			changeset = User.update_changeset(user)
			render(conn, "edit.html", user: user, changeset: changeset)
		else
			conn
			|> put_flash(:error, "That page is not for you!. I'm gonna have to leave you here.")
			|> redirect(to: room_path(conn, :index))
			|> halt()
		end

	end
end