class SessionsController < ApplicationController

  def login
    if logged_in?
      redirect_to welcome_path
    else
      @user = User.new
      render :login
    end
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    @user = @user.try(:authenticate, params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to login_path
    end
  end


end
