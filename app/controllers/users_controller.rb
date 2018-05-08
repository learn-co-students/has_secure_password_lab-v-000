class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = user.create(user_params)
            session[:user_id] = @user.id
            redirect_to homepage_path            
        else
            redirect_to users_new_path
        end
    end
    def show
        @user = User.find_by(name: params[:user][:name])
    end

    private
    def user_params
        params.require(:user).permit(:name, :password)
    end
end
