class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in, :current_user, :login, :authenticate

  def current_user
	  session[:name]
  end

  def logged_in?
	  return true if current_user == session[:name]
  end

  def log_in
	  session[:name] = params[:user][:name]
	  session[:user_id] = @user.id
  end
end
