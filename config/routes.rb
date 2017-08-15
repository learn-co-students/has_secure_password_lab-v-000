Rails.application.routes.draw do
  get '/home', to: 'users#home'
  resources :users
  resources :sessions
end
