class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])

    if user && user.authenticate(params[:user][:password])
      log_in!(user)
      head(:ok)
    else
      flash[:notice] = "Login incorrect"
      redirect_to new_session_path
    end
  end
end