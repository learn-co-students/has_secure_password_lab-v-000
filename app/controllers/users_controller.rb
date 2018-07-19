class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.id
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to new_user_path
    end
  end

  def welcome
    @user = User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
