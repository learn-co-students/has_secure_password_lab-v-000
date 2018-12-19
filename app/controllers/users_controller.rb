class UsersController < ApplicationController

  def new
  end

  def create
    User.create(user_params)
    redirect_to :welcome
  end

  def welcome
    @user = User.find_by(username: params[:username])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
