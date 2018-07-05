defmodule BlogWeb.Resolvers.Content do
  alias Blog.Content

  def list_posts(_parent, _args, _resolution) do
    {:ok, Content.list_posts()}
  end

end
