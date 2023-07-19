Rails.application.routes.draw do
  devise_for :users, defaults: {format: :json}, controllers: {sessions: "sessions"}
  get "/users/current", to: "application#current", defaults: {format: :json}

  get "*path", to: "pages#index", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
