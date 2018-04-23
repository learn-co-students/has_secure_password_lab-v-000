Rails.application.routes.draw do

  root "home#index"
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create]
  get "/welcome" => "home#welcome"
end
