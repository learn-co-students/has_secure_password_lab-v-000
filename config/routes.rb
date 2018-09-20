Rails.application.routes.draw do
  get '/new', to: 'users#new'
  post '/new', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'welcome#home'
end
