Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  
  root 'welcome#home', as: :home
  
end
