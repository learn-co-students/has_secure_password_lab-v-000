class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to new_user_path unless @user.save
    login(@user)
    redirect_to welcome_path
  end

  def welcome

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
