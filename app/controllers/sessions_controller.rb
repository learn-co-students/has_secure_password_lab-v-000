class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
     session[:user_id] = @user.id
     redirect_to homepage_path
    else
      flash[:notice] = "Incorrect name and/or password."
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end