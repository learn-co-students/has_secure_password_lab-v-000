Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'users/new'
post 'users/create'
post 'sessions/create'

end
