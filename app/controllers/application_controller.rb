class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login(user_id)
    session[:user_id] ||= user_id
  end

  # def current_user
  #   @user ||= User.find_by(session[:user_id]).name
  # end

  def logged_in?
    !session[:user_id].nil?
  end
end
