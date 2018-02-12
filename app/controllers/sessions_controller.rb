require 'pry'
class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    #binding.pry
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to home_path
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
