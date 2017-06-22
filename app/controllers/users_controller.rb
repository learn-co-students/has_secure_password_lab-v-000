class UsersController < ApplicationController

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      render 'sessions/index'
    else
      redirect_to users_new_path 
    end
  end

  def new
    
  end  

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end  
  
end
