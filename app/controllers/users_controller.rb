require 'pry'
class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params).save
    redirect_to homepage_path
  end

  def homepage
    redirect_to login_path if !session[:name]
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
