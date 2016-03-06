Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get "/home" => "users#home"

  resources :sessions, only: [:create]
end
