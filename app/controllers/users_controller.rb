class UsersController < ApplicationController

  def create
    
    if User.new(user_params).save
      session[:user_id] = User.last.id
    else
      redirect_to new_user_path
    end
    
  end



  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
    # params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
