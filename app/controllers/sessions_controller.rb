class SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  def new
  end

  def create
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id]=@user.id
      redirect_to welcome_home_path
    else
      redirect_to login_path
    end
  end

  def logout
    reset_session
    redirect_to login_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  def set_user
    @user = User.find_by(name: params[:user][:name])
  end
end
