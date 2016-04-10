Rails.application.routes.draw do
  resources :users

  get '/welcome', :to => "users#welcome"

  resources :sessions
end
