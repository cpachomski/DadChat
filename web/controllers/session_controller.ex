defmodule Dadchat.SessionController do
	use Dadchat.Web, :controller

	def new(conn, _) do
		render conn, "new.html"
	end


	def create(conn, %{"session" => %{"username" => username, "password" => pass}}) do
		case Dadchat.Auth.login_by_username_or_email_and_pass(conn, username, pass, repo: Repo) do
			{:ok, conn} ->
				conn
					|> put_flash(:info, "Welcome back!")
					|> redirect(to: page_path(conn, :index))
			{:error, conn} ->
				conn
					|> put_flash(:error, "Invalid...you're an invalid")
					|> render("new.html")
		end	
	end
end