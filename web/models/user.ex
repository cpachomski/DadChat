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
		|> cast(params, ~w( username email ))
		|> validate_length(:username, min: 3, max: 20)
		|> unique_constraint(:username)
		|> unique_constraint(:username)
	end

	# def registration_changeset(model, params) do
	# 	model
	# 	|> changeset(params)
	# 	|> cast(params, ~w(password), [])
	# 	|> validate_length(:password, min: 6, max: 100)
	# 	|> put_pass_hash()
	# end

	# def put_pass_hash(changeset) do
	# 	case changeset do
	# 		%Ecto.Changeset{valid?: true, changes: %{ password: p}} ->
	# 			put_change(changeset, :password_hash, Comeonin,Bcrypt.hasspwsalt(p))
	# 		_ ->
	# 			changeset
	# 	end
	# end
end