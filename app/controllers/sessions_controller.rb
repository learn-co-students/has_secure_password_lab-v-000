class SessionsController < ApplicationController

  def new
    render '/login'
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      flash[:message] = "Username and password do not match"
      redirect_to '/login'
    end
  end

  def home
    if !!session[:user_id]
      @valid_user = User.find(session[:user_id])
      render '/home'
    else
      render '/login'
    end
  end

end
