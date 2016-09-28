class SessionsController < ApplicationController

  def new
  end

  def create 
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      render :new, alert: 'Wrong Password'
    end
  end

  def destroy
  end
end