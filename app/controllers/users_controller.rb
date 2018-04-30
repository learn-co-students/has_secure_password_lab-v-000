class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_welcome_path
    else
      redirect_to users_new_path
    end
  end

  def user_params
    params.require(:user).permit(:password, :name, :password_confirmation)
  end

end
