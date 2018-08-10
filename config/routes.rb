Rails.application.routes.draw do
  root 'users#create'
  resources :users, only: [:index, :new, :create, :show]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
end
