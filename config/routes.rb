Rails.application.routes.draw do

  get     '/users/new',  :to => 'users#new'
  post    '/users',  :to => 'users#create'

  get     '/login',   :to =>  'sessions#new'
  post    '/sessions',   :to =>  'sessions#create'
  delete  '/logout',  :to => 'sessions#destroy'
  get     '/welcome', :to => 'users#welcome'
end
