Rails.application.routes.draw do
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'users#login'
  post '/login', to: 'users#login'
  get '/sessions', to: 'sessions#create'
end
