defmodule BlogWeb.Resolvers.Accounts do
  @moduledoc "GraphQL Resovler for the Accounts Context"

  alias Blog.Accounts

  def find_user(_parent, %{id: id}, _resolution) do
    case Accounts.get_user!(id) do
      nil ->
        {:error, "User ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end

  def list_users(_parent, _args, _resolution) do
    {:ok, Accounts.list_users()}
  end
end
