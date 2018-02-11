Rails.application.routes.draw do

  root 'application#home'

  resources :users, only: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

end
