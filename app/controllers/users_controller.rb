class UsersController < ApplicationController
  def create
    user = User.new(user_params).save
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
