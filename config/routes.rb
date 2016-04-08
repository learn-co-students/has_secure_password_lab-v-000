Rails.application.routes.draw do
  
  root 'users#home'

    get 'users/new'

  post 'users/new' => 'users#create'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  post '/logout' => 'sessions#destroy'

  



end
