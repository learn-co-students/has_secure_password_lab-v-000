Rails.application.routes.draw do
  resources :users, only: [:create, :new]
  resources :sessions, only: [:create]
  get '/users/homepage' => 'users#homepage', as: :homepage
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new', as: :signup
  post '/signup' => 'users#create'
  post '/users/homepage' => 'sessions#destroy'
end
