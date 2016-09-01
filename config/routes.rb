Rails.application.routes.draw do
  resources :users
  resources :sessions

  get '/users/new', to: 'users#new'

get '/login', to: 'users#new'
end
