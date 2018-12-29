Rails.application.routes.draw do
     get '/index' => 'users#index'
       get '/signup' => 'users#new'
       post '/signup' => 'users#create'
       get '/login' => 'sessions#new'
       post '/login' => 'sessions#create'
end
