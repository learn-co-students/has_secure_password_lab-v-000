class UsersController < ApplicationController

    def index
    end
    
    def new
        @user = User.new
    end

    def create
        if user_params[:name] && confirm_matching_pass
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to users_path
        else
            redirect_to new_user_path
        end
    end
end
