class SessionsController < ApplicationController

  def new
    redirect_to root_path if logged_in?
  end

  def create
    @user  = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Login error. Check your fields."
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
