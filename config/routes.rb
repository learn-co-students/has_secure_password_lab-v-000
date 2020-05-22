Rails.application.routes.draw do
  resources :users
  get '/users/welcome' => 'users#welcome'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
