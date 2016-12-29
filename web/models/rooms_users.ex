defmodule Dadchat.RoomsUsers do
  use Dadchat.Web, :model

  @primary_key false

  schema "rooms_users" do
    belongs_to :room, Dadchat.Room
    belongs_to :user, Dadchat.User

    timestamps()
  end
end
