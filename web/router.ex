defmodule Rumbl.Router do
  use Rumbl.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Rumbl.Auth, repo: Rumbl.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # to see available routes, juse run mix phoenix.routes
  scope "/", Rumbl do
    pipe_through :browser # Use the default browser stack

    # get "/users", UserController, :index
    # get "/users/:id", UserController, :show
    # note the common phoenix actions - :show, :index, :new, :create, :edit, :update, and :delete
    get "/", PageController, :index
    # this does boilerplate RESTful API routes
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Rumbl do
  #   pipe_through :api
  # end
end
