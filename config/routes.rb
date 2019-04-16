Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'users#login'
  post '/login', to: 'users#login'
  get '/sessions', to: 'sessions#create'
  root 'welcome#home'
end
