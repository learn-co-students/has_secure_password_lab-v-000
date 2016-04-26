Rails.application.routes.draw do
 
get 'welcome' => 'welcome#show'

 get '/signup' => 'users#new'
 post '/signup' => 'users#create'
 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 post '/logout' => 'sessions#destroy'

 root 'welcome#show'
 resources :users
end
