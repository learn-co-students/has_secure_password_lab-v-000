class UsersController < ApplicationController
   
   def new
   end
    
  def create
   if @user = User.new(user_params).save
       @user = session[:user_id]
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
