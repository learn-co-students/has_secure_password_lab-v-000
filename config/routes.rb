Rails.application.routes.draw do

  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  post '/users/homepage' => 'users#homepage'
  get '/login' => 'application#login'
  post '/login' => 'sessions#create'

end
