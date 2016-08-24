class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def hello
    redirect_to controller: 'users', action: 'login' unless session[:user_id]
    @hello = current_user
  end

  def current_user
    @user.name if @user = User.find_by(id: session[:user_id])

  end

  private

  def require_logged_in
    redirect_to controller: 'users', action: 'login' unless current_user
  end
end
