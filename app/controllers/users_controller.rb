class UsersController < ApplicationController

  def homepage
    @user = User.find(session[:user_id])
  end

  def new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to '/'
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
