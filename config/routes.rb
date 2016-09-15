Rails.application.routes.draw do
  
  resources :sessions
  
  get 'users/new'
  post 'users/create'
  get 'users/home' => 'users#show'


end