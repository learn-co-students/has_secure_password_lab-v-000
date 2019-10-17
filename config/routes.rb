Rails.application.routes.draw do
  # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-12-authentication/using-has_secure-password-lab
  # new code start
  get 'users/new'
  post 'users/new'
  post 'sessions/create'
  post 'users/create'
  get 'welcome/homepage'
  # new code end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
