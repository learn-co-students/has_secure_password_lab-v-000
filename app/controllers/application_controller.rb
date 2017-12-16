class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user, only: [:hello]

def hello

end


  def current_user #return currently logged in user or nil
      return unless session[:user_id]
      current_user ||= User.find_by_id(session[:user_id]) 
  end
end
