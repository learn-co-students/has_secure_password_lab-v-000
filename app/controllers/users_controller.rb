class UsersController < ApplicationController

    def new

    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/welcome'
        else
            flash[:alert] = "Please make sure your passwords match."
            redirect_to signup_path
        end
    end

    def home
        if current_user.id == nil
            redirect_to login_path, alert: "You must be signed in to view this page."
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end