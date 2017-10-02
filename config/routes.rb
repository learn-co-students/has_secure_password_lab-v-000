Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post '/user', to: 'users#create'
  post '/login', to: 'users#login'
  
  post '/sessions', to: 'sessions#create'
end
