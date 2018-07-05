defmodule BlogWeb.Schema.AccountsTypes do
  @moduledoc "GraphQL Type for the Accounts Context"
  use Absinthe.Schema.Notation

  @desc "A user of the blog"
  object :user do
    field :id, :id
    field :username, :string
    field :posts, list_of(:post)
  end

end
