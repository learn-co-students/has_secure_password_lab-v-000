Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/login' => 'sessions#new'
   resources :sessions
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'
  
 
end
