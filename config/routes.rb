Rails.application.routes.draw do

  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create" 
  get '/logout' => "sessions#destoy"

  resources :users, only: [:new, :create, :destroy]
  
  root 'users#new'
end
