Rails.application.routes.draw do
  resources :users
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'home', to: 'users#home'
end
