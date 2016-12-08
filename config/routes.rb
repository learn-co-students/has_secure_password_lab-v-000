Rails.application.routes.draw do

  #resources :users, only: [:index, :show, :new, :create]

  #resources :sessions, only: [:new, :create, :destroy]

  #issues with routing...

  root 'users#index'

  resources :users

  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
