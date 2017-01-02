defmodule Dadchat.Repo.Migrations.CreateInvitation do
  use Ecto.Migration

  def change do
    create table(:invitations) do
      add :sender, references(:users, on_delete: :nothing)
      add :invitee, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:invitations, [:sender])
    create index(:invitations, [:invitee])
  end
end
