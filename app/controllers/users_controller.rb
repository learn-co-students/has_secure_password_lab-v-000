class UsersController < ApplicationController

    def create

        @user = User.create(strong_params(params))
        if @user.verifiy(params)
            session[:user_id] = @user.id
            redirect_to '/users/show'
        else
            redirect_to '/users/new'
        end
    end

    def new

    end
    private

    def strong_params(params)
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
