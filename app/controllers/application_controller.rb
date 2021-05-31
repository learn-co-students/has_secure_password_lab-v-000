class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #set helper to allow other controllers access to current user
  helper_method :current_user

  def current_user
    session[:user_id]
  end
end
