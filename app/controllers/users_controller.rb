class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]

    if @user.save
      #log them in and welcome user
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      render :new
    end
  end

  def welcome
    if logged_in?
      render :welcome
    else
      redirect_to login_path
    end
  end

end
