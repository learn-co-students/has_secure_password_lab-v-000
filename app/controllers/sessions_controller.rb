class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  helper_method :logged_in?
end
