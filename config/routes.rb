Rails.application.routes.draw do

get "login" => "sessions#new"
post "login" => "sessions#create"

#??? how can I just use "login" without a corresponding directory

# NOTE: sessions doesn't require an id

resources :users, only: [:new, :create]

#resources == PLURAL!

root "welcome#home"

get "users/new" => "users#new"
post "users/:id" => "users#create"
get "welcome/:id" => "welcome#home"


end

