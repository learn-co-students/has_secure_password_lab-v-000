Rails.application.routes.draw do
	root 'welcome#home'

  get 'users/new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users

  
end