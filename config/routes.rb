Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
   

  get '/new'=> 'users#new'
  post '/users'=> 'users#create'
  post '/post' => 'sessions#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'


end
