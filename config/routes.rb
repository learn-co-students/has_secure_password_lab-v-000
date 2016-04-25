Rails.application.routes.draw do
  resources :users
  resources :sessions
  get 'users/welcome', to: 'users#welcome'
  get 'users/signup', to: 'users#new'

  get 'users/login', to: 'sessions#new'
  post 'users/login', to: 'sessions#create'
end
