Rails.application.routes.draw do
  root 'welcome#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/home', to: 'users#home'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
