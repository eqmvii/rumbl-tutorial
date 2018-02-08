defmodule Rumbl.User do
    use Rumbl.Web, :model

    schema "users" do
        field :name, :string
        field :username, :string
        field :password, :string, virtual: true
        field :password_hash, :string

        timestamps
    end

    # had to change this from :empty to :invalid to get around an error
    def changeset(model, params \\ :invalid) do
        model
        |> cast(params, ~w(name username), [])
        |> validate_length(:username, min: 1, max: 20)
    end
end

# primary key is automatic and defaults to :id
# this schema matches a struct to the db columns
# the virtual allows a temporary spot for passwords before persisting hashes
# elixir defines this struct for us and it becomes available as %Rumbl.User{} as before

'''
defmodule Rumbl.User do
    defstruct [:id, :name, :username, :password]
end
'''