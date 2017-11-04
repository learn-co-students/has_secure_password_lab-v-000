Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    get '/home', to: 'welcome#home'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

end
