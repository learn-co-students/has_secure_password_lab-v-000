class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to login_path
    else
      flash[:alert] = "Oops. Looks like there was a problem with your username or password"
      render :"sessions/new"
    end
  end

  def destroy
    session.delete(:name)
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name,:password)
  end
end
