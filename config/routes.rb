Rails.application.routes.draw do
  root "users#index"
  get  "/home"   => "users#index"
  get  "/signup" => "users#new"
  post "/signup" => "users#create"
  get  "/login"  => "sessions#new"
  post "/login"  => "sessions#create"
  get  "/logout" => "sessions#destroy"
end
