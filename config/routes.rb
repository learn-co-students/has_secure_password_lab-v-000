Rails.application.routes.draw do
  root 'welcome#hello'

  get '/signup' => 'users#new'

  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  post '/logout' => 'sessions#destroy'
end
