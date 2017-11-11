require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id if @user && @user.authenticate(params[:user][:password])
    redirect_to user_path(@user.id)
  end
end
