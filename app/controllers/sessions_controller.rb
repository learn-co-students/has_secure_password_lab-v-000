require 'pry'
class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: sessions_params[:name])
    if @user && @user.authenticate(sessions_params[:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to new_user_path
    end
  end


  private

  def sessions_params
    params.require(:user).permit(:name, :password)
  end
end