Rails.application.routes.draw do

  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  get 'users/homepage' => 'users#homepage'
  post '/users/homepage' => 'users#homepage'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

end
