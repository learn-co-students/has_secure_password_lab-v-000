Rails.application.routes.draw do

  get '/signup' => 'sessions#new'
  get 'login' => 'sessions#create'
  # post '/users' => 'users#index'

  get 'users/new' => 'users#new'

end
