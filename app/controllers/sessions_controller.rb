class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      render 'users/homepage'
    else
      redirect_to login_path, alert: "Wrong username/pw combo"
    end

  end

  def destroy
    session.delete :user_id
    redirect_to signup_path
  end
end
