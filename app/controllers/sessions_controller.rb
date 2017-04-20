class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      @user = user
      flash[:notice] = "Logged In Successfully"
      redirect_to welcome_path
    else
      flash[:notice] = "Wrong username/password combo"
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    flash[:notice] = "Logged Out Sucessfully"
    redirect_to login_path
  end
end
