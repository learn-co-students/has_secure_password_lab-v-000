Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#homepage'
  get '/login' => 'users#new'
  post '/login' => 'users#create'
end
