class UsersController < ApplicationController

    def new
    end

    def create
        @user = User.create(user_params)
        unless @user.save
            return redirect_to(controller: 'users', action: 'new')
        end
        session[:user_id] = @user.id
        redirect_to(controller: 'welcome', action: 'index')
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
