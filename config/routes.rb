Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
end
