Rails.application.routes.draw do
  resources :users, only: [:create, :new]
  resources :sessions, only: [:create]
  get 'users/welcome'
end
