class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Find the current_user by finding their session[:user_id] if one exists #
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  # Redirect to login_page unless the user has a session[:user_id] #
  def require_logged_in
    redirect_to login_path unless current_user
  end
end
