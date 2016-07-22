Rails.application.routes.draw do
  root 'welcome#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  resources :users

end
