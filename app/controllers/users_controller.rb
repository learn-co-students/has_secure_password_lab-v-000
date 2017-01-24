class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params).save
    if user
      session[:user_id] = User.last.id
    else
      redirect_to users_new_path
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
