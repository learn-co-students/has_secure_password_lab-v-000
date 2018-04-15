class UsersController < ApplicationController

    def new
        @user = User.find(params[:id])
    end
    
    def create
        @user = User.new(user_params)
         if !@user.name || @user.name.empty? || @user.password != @user.password_confirmation
       redirect_to '/users/new'
   else
            @user.save
            session[:user_id] = @user.id
            redirect_to '/welcome/welcome'
        end
    end
    

    
    private
    def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
