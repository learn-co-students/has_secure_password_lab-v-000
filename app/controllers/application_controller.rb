
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  # this before action is top level. We are setting the user variable in one place
  # so we don't have to call it all over the controllers

  # if there is no session open, create a new user object with no params
  # this is for the form to wrap around
  def current_user 
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id != nil
  end

  def require_logged_in
    return redirect_to login_path unless logged_in?
  end
end