class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user_exists
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to login_path
  end

  def destroy
  end
end
