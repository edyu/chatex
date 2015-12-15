defmodule Chatex.Router do
  use Chatex.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Chatex do
    pipe_through :browser # Use the default browser stack

    get "/", RoomsController, :show, as: :lobby
    get "/:id", RoomsController, :show, as: :room
  end

  # Other scopes may use custom stacks.
  # scope "/api", Chatex do
  #   pipe_through :api
  # end
end
