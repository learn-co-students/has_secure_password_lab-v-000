Rails.application.routes.draw do
  
  get '/create', to: 'sessions#create'
  # get 'users/create'
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
