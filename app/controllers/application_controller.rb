class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_user=(id)
    session[:user_id] = id
  end

  def logged_in?
    !!self.current_user
  end

  def logg_out!
    session.delete(:user_id)
  end
end
