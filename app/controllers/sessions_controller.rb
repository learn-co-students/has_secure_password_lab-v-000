class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user = user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      redirect_to welcome_path
    else
      redirect_to sessions_new_path
    end
  end
end
