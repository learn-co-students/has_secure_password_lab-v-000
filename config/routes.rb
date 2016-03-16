Rails.application.routes.draw do
  root 'welcome#hello'

  post '/login', to: 'sessions#create'
  
  resources :users, only: [:new, :create, :show]
end
