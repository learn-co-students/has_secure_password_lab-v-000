Rails.application.routes.draw do

  get "/signup" => "users#new"
  post "/signup" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  post "/logout" => "sessions#destroy"

  root "welcome#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
