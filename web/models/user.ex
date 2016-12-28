defmodule Dadchat.User do
	use Dadchat.Web, :model

	schema "users" do
		field :username, :string
		field :email, :string
		field :password, :string, virtual: true
		field :password_hash, :string

		timestamps
	end

	def changeset(model, params \\ :invalid) do
		model 
		|> cast(params, ~w(first_name last_name username email))
		|> validate_length(:username, min: 1, max: 20)
		|> unique_constraint(:username)
		|> unique_constraint(:username)
	end
end