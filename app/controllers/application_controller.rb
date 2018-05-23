class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  def logged_in?
    session[:user_id].present?
  end

  def require_logged_in
    if !logged_in?
      redirect_to login_path
    end
  end

  def current_user
    User.find_by(id: session[:user_id]) || User.new
  end
end
