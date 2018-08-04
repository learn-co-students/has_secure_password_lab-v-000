require 'pry'
class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if !user.save
      redirect_to signup_path
    else
  #    redirect_to(:controller => 'sessions', :action => 'create', params: user_params)
      session[:user_id] = user.id
      redirect_to homepage_path
    end
  end

  def homepage
    redirect_to login_path if !session[:name]
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
