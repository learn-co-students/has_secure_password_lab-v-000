Rails.application.routes.draw do
  
  root 'users#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  resources :users
  resources :sessions

end
