Rails.application.routes.draw do

  # User signup and deletion
  get 'users/new', to: 'users#new', as: 'signup'
  post 'users/create', to: 'users#create', as: 'create_user'
  post 'users/destroy', to: 'users#destroy', as: 'delete_user'

  # User login
  get 'sessions/new', to: 'sessions#new', as: 'login'
  post 'sessions/create', to: 'sessions#create', as: 'sessions'
  post 'sessions/destroy', to: 'sessions#destroy', as: 'logout'

  # Welcome page
  get 'welcome', to: 'welcome#welcome'

  # Homepage is login
  root 'sessions#new'

  # Alias routes
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

end
