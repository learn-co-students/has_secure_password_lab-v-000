class SessionsController < ApplicationController
  # Handles users already in database

  # login_path
  def new
  end

  # sessions_path
  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to login_path
    end

  end

  # logout_path
  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end