Rails.application.routes.draw do
    root to: 'users#index'
    post '/login', to: 'sessions#create'
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    get '/show', to: 'users#show'
    post '/logout', to: 'sessions#destroy'
end
