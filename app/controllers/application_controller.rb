class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user, except: [:index]

  def index
    redirect_to login_path if !logged_in
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end
end
