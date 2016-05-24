Rails.application.routes.draw do
  root 'welcome#home'
  resources :sessions, only: [:create, :new]
  resources :users, only: [:create, :new]
  get '/login', to: 'sessions#new'
end
