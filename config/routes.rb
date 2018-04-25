Rails.application.routes.draw do
  root 'sessions#create'
  resource :users, only: %i[show create new]
  resource :sessions, only: %i[create new]
end
