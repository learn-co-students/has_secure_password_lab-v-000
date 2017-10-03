class UsersController < ApplicationController

    def new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            redirect_to '/home'
        else
            redirect_to(controller: 'users', action: 'new')
        end
    end

    def home
        @user = User.find_by(name: params[:name])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
