Rails.application.routes.draw do
  
  root 'application#welcome'
  resources :sessions, :users
end
