class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(users_params).save
  end

  private
  def users_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
