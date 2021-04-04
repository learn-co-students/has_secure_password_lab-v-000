Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'
  resources :users, only: [:create, :destroy, :index]
  get '/signup', to: 'users#new'
  get 'users/welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
