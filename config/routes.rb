Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#welcome'

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get 'users/welcome', to: 'users#welcome'

  get 'users/login', to: 'users#login'
end
