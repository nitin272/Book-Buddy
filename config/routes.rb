Rails.application.routes.draw do
  get "pages/about"
  root "home#index"
  get "home/index"

  resources :users
  resources :books

  get "dashboard/index"


  get    "/signup",  to: "users#new"
  post   "/signup",  to: "users#create"


  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get    "/logout",  to: "sessions#destroy"
  get "/about", to: "pages#about"



  get "up" => "rails/health#show", as: :rails_health_check

  get "/dashboard", to: "dashboard#index"

  # root "sessions#new"
end
