Rails.application.routes.draw do
  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  post '/login' => 'users#create'

  get '/signup' => 'users#new'
  # root 'users#new'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
