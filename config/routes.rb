Rails.application.routes.draw do
  resources :users

  get '/welcome', to: 'users#welcome'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
