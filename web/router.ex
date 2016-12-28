defmodule Dadchat.Router do
  use Dadchat.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Dadchat.Auth, repo: Dadchat.Repo
  end

  scope "/", Dadchat do
    pipe_through :browser

    get "/", PageController, :index

    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController only: [:new, :create, :delete]
  end
end
