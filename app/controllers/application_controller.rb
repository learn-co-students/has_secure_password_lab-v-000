class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    #sets @user variable to either logged in user or new user
    @user = (User.find_by_id(session[:user_id]) || User.new)
  end

  def logged_in?
    #checks if there is a :user_id in session
    current_user.id != nil
  end

  def require_logged_in
    #redirect to login unless logged_in
    return redirect_to login_path unless logged_in?
  end

end
