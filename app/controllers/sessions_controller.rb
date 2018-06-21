class SessionsController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.password == '' || @user.password != User.find_by(name: @user.name).password
      redirect_to @user
    else
      session[:user_id] = User.find_by(name: @user.name).id
      redirect_to @user
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
