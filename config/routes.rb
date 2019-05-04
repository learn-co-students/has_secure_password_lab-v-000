Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # get '/show' => 'secrets#show'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    post '/logout' => 'sessions#destroy'
    get '/new' => 'users#new'
    post '/create' => 'users#create'
    get '/show/:id' => 'users#show'

end
