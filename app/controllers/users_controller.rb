require 'pry'
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.password != @user.password_confirmation
      redirect_to new_user_path
    end
    session[:user_id] = @user.id
  end

  def homepage

  end

  private

  def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
