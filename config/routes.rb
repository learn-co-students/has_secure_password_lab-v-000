Rails.application.routes.draw do
  get 'users/new'

  root 'sessions#new'
  get '/login' => 'sessions#new'
  get 'users/create'
  post '/login' => 'sessions#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
