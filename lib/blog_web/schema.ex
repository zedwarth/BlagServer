defmodule BlogWeb.Schema do
  @moduledoc "GraphQL Schema"

  use Absinthe.Schema
  import_types BlogWeb.Schema.ContentTypes
  import_types BlogWeb.Schema.AccountsTypes

  alias BlogWeb.Resolvers.{Accounts, Content}

  query do

    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve &Content.list_posts/3
    end

    @desc "Get a user of the blog"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &Accounts.find_user/3
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve &Accounts.list_users/3
    end

  end

end
