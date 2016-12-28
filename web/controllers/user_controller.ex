defmodule Dadchat.UserController do
	use Dadchat.Web, :controller
	alias Dadchat.User

	def new(conn, _params) do
		changeset = User.changeset(%User{})
		render conn, "new.html", changeset: changeset
	end
end