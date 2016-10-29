Rails.application.routes.draw do
  root 'welcome#home'

  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get  '/signup', to: 'users#new'
  get  '/users/show', to: 'users#home'

  resources :users
end
