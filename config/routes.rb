Rails.application.routes.draw do
  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'
  resources :users, only: [:new, :create, :destroy, :index]
  get 'users/welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
