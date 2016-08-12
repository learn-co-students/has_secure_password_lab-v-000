Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/welcome/index' => 'welcome#index'
  resources :users, only: [:new, :create]
end
