class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])
    return redirect_to login_path unless authenticated
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destory
    session.clear
    redirect_to login_path
  end
end
