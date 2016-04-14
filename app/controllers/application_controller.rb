class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_user
    @user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
  end
end
