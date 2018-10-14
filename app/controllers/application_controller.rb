class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    session[:user_id]
  end

  def require_login
    redirect_to controller: 'sessions', action: 'new' unless logged_in?
  end

end
