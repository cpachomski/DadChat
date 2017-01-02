defmodule Dadchat.Invitation do
  use Dadchat.Web, :model
  require Logger
  schema "invitations" do
    field :sender, :integer
    field :invitee, :integer
    field :room, :integer

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:invitee, :sender, :room])
    |> validate_required([])
  end
end
