class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      log_in(user)
      redirect_to '/'
    else
      redirect_to new_user_path
    end
  end

  def destroy

  end
end
