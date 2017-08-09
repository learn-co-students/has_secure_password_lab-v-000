Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, except: [:index, :edit, :update]
  get '/logout', to: 'sessions#destroy'
  root 'application#index'
end
