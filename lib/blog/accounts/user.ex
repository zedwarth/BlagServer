defmodule Blog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :username, :string

    has_many :posts, Blog.Content.Post
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end
end
