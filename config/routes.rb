Rails.application.routes.draw do
  #resources :users, only: [:new, :create]
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/welcome' => 'users#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
