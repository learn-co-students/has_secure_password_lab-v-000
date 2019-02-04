Rails.application.routes.draw do
  root 'application#hello'
  resources :users, :sessions
end
