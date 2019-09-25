class UsersController < ApplicationController
    def create
        #binding.pry
        @user = User.create(user_params)
        if user_params[:password] ==  user_params[:password_confirmation]
          @user.save  
          session[:user_id] = @user.id
          redirect_to  user_path(@user)
        else
           redirect_to new_user_path()
        end
    end

    def show
        @user = User.find_by(user_params)
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
    
end