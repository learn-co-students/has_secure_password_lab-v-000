Rails.application.routes.draw do
  get '/', to: 'welcome#welcome', as: 'root'
  post '/sessions', to: 'sessions#create'
  resources :users, only:[:new, :create]
end
