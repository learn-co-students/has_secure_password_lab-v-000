require 'pry'
class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end


end
