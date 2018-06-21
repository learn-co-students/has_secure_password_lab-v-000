Rails.application.routes.draw do
  resources :users
  resources :sessions
  get '/home', to: 'welcome#home'
end
