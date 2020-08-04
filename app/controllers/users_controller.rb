class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #raise params.inspect
    @user = User.create(user_params)
    redirect_to root_path #=> GET "/"
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
