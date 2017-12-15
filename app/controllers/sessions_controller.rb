class SessionsController < ApplicationController

  def new
    render 'login'
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to welcome_path(@user)
    else
      flash[:notice] = "Incorrect password"
      redirect_to login_path
    end
  end

end
