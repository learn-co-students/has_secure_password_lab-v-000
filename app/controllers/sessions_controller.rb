require 'pry'

class SessionsController < ApplicationController
 
  def create
    @user = User.find_by(name: user_params[:name])
    return head(:forbidden) unless @user.authenticate(user_params[:password])
    session[:user_id] = @user.id
    redirect_to 'sessions/home'
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

