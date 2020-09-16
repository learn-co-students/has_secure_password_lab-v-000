Rails.application.routes.draw do
  root 'sessions#index'
  #sign up new user
    resources :users, only: [ :new, :create ]
      # POST /users(.:format)     users#create
      # post '' - #create method makes and saves new user  

      # get 'users/new' - #new method will render template
      # GET  /users/new(.:format) users#new

  #login exzisting user
    #get login page template
    get '/login', to: 'sessions#new'
    post '/', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
  
end
