Rails.application.routes.draw do
  root "home#index"
  get "home/index"

  resources :users do
    resources :books
  end

  get "dashboard/index"


  get    "/signup",  to: "users#new"
  post   "/signup",  to: "users#create"


  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get    "/logout",  to: "sessions#destroy"


  get "up" => "rails/health#show", as: :rails_health_check

  get "/dashboard", to: "dashboard#index"

  # root "sessions#new"
end
