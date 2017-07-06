Rails.application.routes.draw do
  get 'users/new' #signup page
  post 'users/create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'welcome/home', to: 'welcome#index'
end
