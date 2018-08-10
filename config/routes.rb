Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: [:new, :create, :show]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
end
