class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    if current_user
      redirect_to user_path and return
    else
      redirect_to root_path and return
    end
  end
end