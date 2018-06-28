Rails.application.routes.draw do
  get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
post '/logout' => 'sessions#destroy'
get '/home' => 'users#home'

resources :users
end
