defmodule BlogWeb.Router do
  use BlogWeb, :router

  origins = Application.fetch_env!(:blog, :origins)

  pipeline :api do
    plug Corsica,
      origins: origins,
      allow_headers: ["content-type"]

    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: BlogWeb.Schema

    forward "/", Absinthe.Plug,
      schema: BlogWeb.Schema

  end

end
