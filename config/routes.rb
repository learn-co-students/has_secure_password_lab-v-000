Rails.application.routes.draw do
  resources :users, only: [:show, :create, :new]
  post 'sessions/create', to: 'sessions#create'
  get '/login', to: 'sessions#new'
end
