Rails.application.routes.draw do
  resources :users, :sessions
  get 'application/welcome'
end
