class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
    if session.include?(:user_id)
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

end
