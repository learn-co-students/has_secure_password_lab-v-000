Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "users#new"
  resources :users

  get '/login', to: "sessions#new"

  resources :sessions

  post '/logout', to: "sessions#destroy"
end
