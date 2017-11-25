Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:create, :new, :destroy]
end
