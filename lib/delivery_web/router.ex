defmodule DeliveryWeb.Router do
  use DeliveryWeb, :router

  alias DeliveryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", DeliveryWeb do
    pipe_through :api

    resources "/users", UsersController, except: [:new, :edit]
    resources "/items", ItemsController, except: [:new, :edit]

  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:delivery, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: DeliveryWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
