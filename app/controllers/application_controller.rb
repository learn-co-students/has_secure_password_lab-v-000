class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  # loads the user from the session's user_id key
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # sets session user_id key in session has to the id of the user that was passed in
  def log_in!(user)
    session[:user_id] = user.id
  end
end
