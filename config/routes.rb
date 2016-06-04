Rails.application.routes.draw do
  root 'welcome#index'

  resources :sessions, only: :create

  resources :users, only: [:new, :create]
end
