class UsersController < ApplicationController
  def new
  end

  def create
    User.create(user_params)
    redirect_to '/show'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
