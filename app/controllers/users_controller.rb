class UsersController < ApplicationController
  def homepage
    render :new
  end

  def create
    user = User.new(user_params).save
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
