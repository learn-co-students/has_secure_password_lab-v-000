Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy, :new]
  resources :users, only: [:welcome, :create, :new]

  root 'users#welcome'
end
