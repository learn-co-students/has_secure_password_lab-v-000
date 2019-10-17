Rails.application.routes.draw do

  root 'sessions#index'
  get '/homepage', to: 'welcome#homepage'
  resources :sessions, only: [:index, :new, :create]
  resources :users, only: [:new, :create, :show]


end
