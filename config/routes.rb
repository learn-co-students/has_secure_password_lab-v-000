Rails.application.routes.draw do
  resources :users
  root 'application#home'
  resources :sessions, only: [:new, :create]
end
