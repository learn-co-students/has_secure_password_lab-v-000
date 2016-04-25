class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return redirect_to new_session_path unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to users_welcome_path
  end
end
