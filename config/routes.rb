Rails.application.routes.draw do
  # get 'users/new'

  # get 'users/create'
  get '/' => 'users#homepage'
  resources :users, :only => [:new, :create]
  get '/new' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
