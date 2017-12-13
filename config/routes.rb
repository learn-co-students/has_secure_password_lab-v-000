Rails.application.routes.draw do
  resources :users
  
  get '/new', to: 'sessions#new'
  post '/', to: 'sessions#create'
  get '/destroy', to: 'sessions#destroy'
end
