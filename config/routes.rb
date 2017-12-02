Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'users/new' => 'users#new'
  # post 'users/new' => 'users#create'

  # root 'application#hello'
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # post '/logout' => 'sessions#destroy'
  root 'users#welcome'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  post '/logout' => 'sessions#destroy'  
  resources :users, :only => [:new, :create ]


end
