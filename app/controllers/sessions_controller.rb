class SessionsController < ApplicationController
  def index
    if session[:user_id].nil?
      redirect_to signup_path
    else
      @user = User.find(session[:user_id])
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to homepage_path
    else
      redirect_to login_path
    end
  end
end
