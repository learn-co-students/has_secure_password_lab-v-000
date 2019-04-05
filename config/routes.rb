Rails.application.routes.draw do
  get 'sessions/new'

  post '/users', to: 'users#create'
  get '/new', to: 'users#new'
  get '/create', to: 'sessions#create'


  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
