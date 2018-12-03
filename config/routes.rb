Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create', as: 'new_session'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :users, except: [:new, :create]
  #get '/signup' => 'users#create'

  root 'application#welcome'

end
