class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def logged_in?
    session.exists?(:user_id)
  end

  def require_login
    if !logged_in?
      redirect_to login_path
    end
  end

  def current_user
    User.find_by(id: session[:user_id]) || User.new
  end
end
