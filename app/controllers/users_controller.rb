class UsersController < ApplicationController
    before_action :logged_in?, only: %i[show]

    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end

    def create
        if confirmed_password?
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/users/new', alert: "Passwords must match."
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def logged_in?
        session[:user_id]
    end

    def confirmed_password?
        params[:user][:password] == params[:user][:password_confirmation]
    end
end
