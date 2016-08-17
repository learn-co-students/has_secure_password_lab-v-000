Rails.application.routes.draw do
  get 'users/new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users

  root 'welcome#home'
end
