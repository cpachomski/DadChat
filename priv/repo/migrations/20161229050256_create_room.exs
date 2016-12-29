defmodule Dadchat.Repo.Migrations.CreateRoom do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :title, :string
      add :topic, :string

      timestamps()
    end

  end
end
