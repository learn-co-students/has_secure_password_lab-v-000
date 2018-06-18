Rails.application.routes.draw do
  resources :users, only: [:show, :destroy]
  resources :sessions, only: [:destroy]

  get '/signup' => "users#new", as: :signup
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'

end
