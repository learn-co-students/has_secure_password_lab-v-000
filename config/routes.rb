Rails.application.routes.draw do
  root 'welcome#index'
  get '/users/new' => 'users#new'
  post '/users/create' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create' 
  post '/logout' => 'sessions#destroy'
end
