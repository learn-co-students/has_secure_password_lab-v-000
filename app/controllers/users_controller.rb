class UsersController < ApplicationController

  def new
  end

  def create
    user = User.create(user_params)
    redirect_to new_user_path if user.id.nil?
    session[:user_id] = user.id
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
