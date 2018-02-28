require 'pry'
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
  #binding.pry
    if  params[:user][:password] == params[:user][:password_confirmation]
      user = User.new(user_params)
      user.save
      session[:user_id] = user.id
      redirect_to '/users/welcome'
    else
      redirect_to '/users/signup'
    end
  end

  def welcome
    @user = User.find_by(id: session[:user_id])
    render 'welcome'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
