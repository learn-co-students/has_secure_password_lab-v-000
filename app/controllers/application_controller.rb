class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_logged_in


  def logged_in?
    current_user.id != nil
  end

  # def logged_in?
  # 	session[:user_id] = current_user.id
  # end

  def current_user
  	User.find_by(id: params[:id])
  end

	def require_logged_in
			return redirect_to '/sessions/new' unless logged_in?
	end
end
