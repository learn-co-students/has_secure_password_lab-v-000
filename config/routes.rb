Rails.application.routes.draw do

  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/signup' => 'users#create'
  post '/logout' => 'sessions#destroy'

  resources :users, only: :new

end