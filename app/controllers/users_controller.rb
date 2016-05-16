require 'pry'

class UsersController < ApplicationController
  def new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = User.create(user_params)
      session[:user_id] = user.id
      redirect_to welcome_index_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end