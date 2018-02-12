class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to '/welcome'
    else
      @user = User.new
      render :login
    end
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      flash[:notice] = "incorrect Login Information..."
      render :login
    end
  end

  def destroy
    session.destroy
    redirect_to '/login'
  end
end
