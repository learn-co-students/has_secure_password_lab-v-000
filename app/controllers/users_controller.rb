require 'pry'

class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Account creation success"
      redirect_to user_path(user)
    else
      flash[:notice] = "Account creation failed"
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
