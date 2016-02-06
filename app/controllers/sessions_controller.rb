class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    return redirect_to new_user_path unless authenticated
    session[:user_id] = authenticated.id
    redirect_to root_path
  end

  def destroy
    reset_session!
    redirect_to login_path
  end
end
