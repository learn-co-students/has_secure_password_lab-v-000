Rails.application.routes.draw do

get "users/new", "users#new"
post "users/:id", "users#create"


end
