class UsersController < ApplicationController
   helper_method :current_user
   def new
   end
    
   def create
      @user = User.create(user_params)
     if @user.save
    session[:user_id] = @user.id
    redirect_to '/welcome/welcome'
else
    redirect_to '/users/new'

  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
