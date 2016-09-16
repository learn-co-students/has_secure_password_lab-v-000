Rails.application.routes.draw do
  resources :users

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  post '/destroy' => "sessions#destroy"

  root 'welcome#home'
end
