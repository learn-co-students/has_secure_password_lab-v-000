Rails.application.routes.draw do

  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create" 
  get '/logout' => "sessions#destoy"

  resources :users
  
  root 'users#new'
end
