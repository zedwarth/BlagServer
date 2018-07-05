defmodule BlogWeb.Schema.ContentTypes do
  @moduledoc false

  use Absinthe.Schema.Notation

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :user_id, :user
  end

end
