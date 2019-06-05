class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
  end

  def show
    @user = User.find_by_id(session[:user_id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end