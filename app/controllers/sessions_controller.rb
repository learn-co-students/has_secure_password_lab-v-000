class SessionsController < ApplicationController
  before_action :check_login, only: [:destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to(root_path)
    else
      @user = User.new(user_params)
      flash[:alert] = true
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to(login_path)
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end
