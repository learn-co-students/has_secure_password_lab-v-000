require 'pry'
class UsersController < ApplicationController


  def new
    render :new
  end

  def create 
    @user = User.new(user_params)

    if @user.password == @user.password_confirmation
      @user.save    
      session[:user_id] = @user.id
      redirect_to 'sessions/home'
    else
      redirect_to 'http://test.host/users/new'
    end

  end

private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
