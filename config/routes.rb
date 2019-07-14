Rails.application.routes.draw do

  get 'users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/welcome' => 'welcome#hello'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # root 'application#hello'
  # post '/login' => 'sessions#create'
  # post '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
