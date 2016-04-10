class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to new_user_path unless user
    session[:user_id] = user.id
    redirect_to welcome_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_user_path
  end
end
