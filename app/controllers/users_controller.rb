class UsersController < ApplicationController
    def index
        require_login
    end

    def new
    end

    def create
        user = User.new(user_params)

        if user.valid?
            user.save

            session[:user_id] = user.id

            redirect_to action: :index
        else
            redirect_to action: :new
        end
    end
end