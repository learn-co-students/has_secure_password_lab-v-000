class SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  def new
    @user = User.new
  end

  def create
    @user= User.find_by(name: params[:user][:name])
    if @user.nil?
      redirect_to login_path, alert:"Users doe not exists, please try again or signup"
    else
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id]=@user.id
        redirect_to welcome_home_path
      else
        redirect_to login_path, alert: "Wrong pwd. Please, try again"
      end

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
