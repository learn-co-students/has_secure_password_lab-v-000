class UsersController < ApplicationController
  def new
  end
  def create
    @user = User.create(user_params)
    if @user.password == @user.password_confirmation
      log_in
      redirect_to users_welcome_path
    else
      redirect_to new_user_path
    end
  end

  def welcome
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
