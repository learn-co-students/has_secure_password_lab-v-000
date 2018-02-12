class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user

    session[:user_id] = user.id

    @user = user

    redirect_to root_path

  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
