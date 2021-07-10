Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/home', to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
