class SessionsController < ApplicationController
  def new
  end

  def create 
    @user = User.find_by(name: params[:user][:name])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash[:alert] = "Invalid input"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
