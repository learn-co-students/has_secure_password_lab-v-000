class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Signed in successfully'
    else
      flash.now.alert = 'Invalid email or password.'
      render :new
    end
  end

  def destory
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out successfully.'
  end
end
