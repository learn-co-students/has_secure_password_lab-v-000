class UsersController < ApplicationController
    
    def home
    end 

    def new 
    end

    def create
        user = User.new(user_params)
        return redirect_to(controller: 'users', action: 'new') unless @user.save 
        session[:user_id] = @user.user_id
        redirect_to(controller: 'users', action: 'home')
    end

    private
 
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
