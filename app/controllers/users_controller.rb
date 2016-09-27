require "pry"
class UsersController < ApplicationController
  def new
    
  end

  def create
    if params[:user][:name] == nil || params[:user][:name].empty? || params[:user][:password] != params[:user][:password_confirmation]
      redirect_to "/users/new"
    else
      user = User.new(user_params)
      user.save
      session[:user_id] = user.id
      redirect_to "homepage"
    end
  end

  def homepage
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to "/login"
    end
  end

  private
 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end