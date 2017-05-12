class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end


end
