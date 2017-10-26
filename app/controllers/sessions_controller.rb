class SessionsController < ApplicationController

  def login
    if session[:user_id].present?
      redirect_to welcome_path
    else
      render :login
    end
  end

  def create
    @user = User.find_by(name: params[:name])
    @user = @user.try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to login_path
    end
  end


end
