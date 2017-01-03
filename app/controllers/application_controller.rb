class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def hello
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    @user ||= session[:user_id]
  end

  def password?
    params[:user][:password] || !params[:user][:password].nil?
  end

  def matching_password?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
