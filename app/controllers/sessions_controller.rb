class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to login_path, alert: "Incorrect"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to new_user_path
  end
end
