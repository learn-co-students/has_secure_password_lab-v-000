class SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  def new
    @user = User.new
  end

  def create
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id]=@user.id
      redirect_to welcome_home_path
    else
      redirect_to login_path, alert: "Please, try it again"
    end
  end

  def logout
    reset_session
    redirect_to login_path
  end

  private
  def set_user
    @user = User.find_by(name: params[:user][:name])
  end
end
