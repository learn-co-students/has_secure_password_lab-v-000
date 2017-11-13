Rails.application.routes.draw do
  resources :users
  resources :sessions
  get '/welcome', to: 'welcome#welcome', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/logout', to: 'sessions#destroy'
end
