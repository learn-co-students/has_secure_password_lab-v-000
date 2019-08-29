Rails.application.routes.draw do

  resources :sessions, only: [:index, :new, :create]
  resources :users, only: [:new, :create, :show]


end
