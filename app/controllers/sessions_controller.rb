class SessionsController < ApplicationController
  before_action :require_log_in

  def new
  end

  def create
    @user= User.find_by(name: params[:user][:name])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      
      redirect_to users_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to new_user_path
  end
end


