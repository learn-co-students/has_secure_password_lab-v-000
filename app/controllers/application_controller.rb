class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user 
    User.find_by(session[:user_id]) || User.new
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end

end