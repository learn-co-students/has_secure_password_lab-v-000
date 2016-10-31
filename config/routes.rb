Rails.application.routes.draw do
  root 'sessions#index'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
