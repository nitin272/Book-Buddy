Rails.application.routes.draw do
  get "dashboard/index"
  # User signup routes
  get    "/signup",  to: "users#new"
  post   "/signup",  to: "users#create"

  # User login/logout routes
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get "/logout",  to: "sessions#destroy"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  get "/dashboard", to: "dashboard#index"

  root "sessions#new"
end
