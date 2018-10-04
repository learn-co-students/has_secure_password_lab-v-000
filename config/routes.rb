Rails.application.routes.draw do

resource :users, only: [:new, :create]
resource :sessions, only: [:create]
resource :welcome, only: [:index]

end
