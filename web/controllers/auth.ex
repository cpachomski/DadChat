defmodule Dadchat.Auth do
	import Plug.Conn
	alias Dadchat.User
	import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

	def init(opts) do
		Keyword.fetch!(opts, :repo)
	end

	def call(conn, repo) do
		user_id = get_session(conn, :user_id)
		user    = user_id && repo.get(User, user_id)
		assign(conn, :current_user, user)
	end

	def login(conn, user) do
		conn
		|> assign(:current_user, user)
		|> put_session(:user_id, user.id)
		# send different session cookie back with different id
		|> configure_session(renew: true)
	end

	def login_by_username_or_email_and_pass(conn, username, given_pass, opts) do
		repo = Keyword.fetch!(opts, :repo)
		user = repo.get_by(Dadchat.User, username: username) 
				|| 
			   repo.get_by(Dadchat.User, email: username)

		cond do
			user && checkpw(given_pass, user.password_hash) ->
				{:ok, login(conn, user)}
			user -> 
				{:error, :unauthorized, conn}
			true ->
				dummy_checkpw()
				{:error, :not_found, conn}
		end		   	


	end
end
