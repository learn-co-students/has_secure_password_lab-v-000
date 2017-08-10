Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/home' => 'users#show', as: 'home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
end
