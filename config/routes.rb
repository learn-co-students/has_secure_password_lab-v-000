Rails.application.routes.draw do

  root 'application#welcome'
  resources :users, only: [:new, :create]
  resources :sessions, only:[:create]

end
