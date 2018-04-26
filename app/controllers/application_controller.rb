class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    unless session[:user_id].nil? || session[:user_id].empty?
      return session[:user_id]
    else
      return nil
    end
  end

end
