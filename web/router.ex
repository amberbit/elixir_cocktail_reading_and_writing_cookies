defmodule CookiesTestApp.Router do
  use CookiesTestApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CookiesTestApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/create", PageController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", CookiesTestApp do
  #   pipe_through :api
  # end
end
