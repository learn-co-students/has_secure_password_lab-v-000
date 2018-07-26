Rails.application.routes.draw do
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
end
