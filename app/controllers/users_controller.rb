class UsersController < ApplicationController
    attr_accessor :name

    def new
        # It should respond to new with the signup form,
    end

   
    def create
        # create by creating a new user.
        User.create(user_params)

    end  

    def signup

    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end


end
