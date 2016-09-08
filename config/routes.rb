Rails.application.routes.draw do

  root 'welcome#show'

  get '/signup' => 'users#new', as: 'signup'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end

