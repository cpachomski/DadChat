defmodule Dadchat.RoomsUsersTest do
  use Dadchat.ModelCase

  alias Dadchat.RoomsUsers

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RoomsUsers.changeset(%RoomsUsers{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RoomsUsers.changeset(%RoomsUsers{}, @invalid_attrs)
    refute changeset.valid?
  end
end
