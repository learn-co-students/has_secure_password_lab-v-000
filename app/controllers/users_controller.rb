class UsersController < ApplicationController
  def new
  end

  def create
    if user = User.new(user_params).save
      session[:user_id] = User.last.id
    else
      redirect_to users_new_url
    end
  end

  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end