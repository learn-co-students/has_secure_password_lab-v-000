Rails.application.routes.draw do
  resources :users
  resources :sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
