class UsersController < ApplicationController
    # user creation form
    def new

    end

    # create the user in the database
    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to new_user_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
