class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(name: session_params[:name])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to login_path
    end
  end

  private

  def session_params
    params.require(:user).permit(:name,:password)
  end
end
