Rails.application.routes.draw do
  
  root 'welcome#home'
  
  get '/login', to: 'sessions#new'
  
  post '/login', to: 'sessions#create'
  
  resources :users, only: [:new, :create]
end
