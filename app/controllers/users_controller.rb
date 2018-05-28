class UsersController < ApplicationController

  def create
    user = User.new(user_params).save
  end

  private
  def users_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
