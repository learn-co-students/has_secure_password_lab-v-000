class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  
  def logged_in?
    !!current_user
  end
  
  def require_login
    redirect_to login_path unless current_user 
  end
  
  def current_user
    #return the current user or find the user in the db if someone is logged in.
    session[:user_id] ||= User.find_by_id(session[:user_id]) if session[:id]
  end
  
  
end
