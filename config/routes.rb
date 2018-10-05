Rails.application.routes.draw do

resource :users, only: [:new, :create]

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
post '/logout', to: 'sessions#destroy'

get '/welcome', to: 'welcome#index'

end
