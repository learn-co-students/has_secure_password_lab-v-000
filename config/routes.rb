Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users, only: [:new, :create]
  # get "/users/new" route is mapped to #new action (method) in UsersController,
  # which renders the form to create a new user (i.e. the signup form)
  # route helper method #new_user_path returns string URL path "/users/new"

  # post "/users" route is mapped to the #create action (method) in UsersController
  # route receives data submitted in signup form and creates new user

  get '/login', to: 'sessions#new' # rendering the login form
  post '/login', to: 'sessions#create' # logging the user in (creating a session)
  delete '/logout', to: 'sessions#destroy' # logging the user out
  get '/welcome', to: 'welcome#greet_user' # rendering the user homepage
end
