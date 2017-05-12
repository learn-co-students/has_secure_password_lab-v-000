Rails.application.routes.draw do
  resources :users
  post 'sessions/create' => 'sessions#create'

end
