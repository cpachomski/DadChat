defmodule Dadchat.Room do
  use Dadchat.Web, :model

  schema "rooms" do
    field :title, :string
    field :topic, :string


    many_to_many :users, Dadchat.User, join_through: Dadchat.RoomUser
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :topic])
    |> validate_required([:title, :topic])
  end
end
