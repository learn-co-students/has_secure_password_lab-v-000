Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '/homepage' => 'welcome#homepage'

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
