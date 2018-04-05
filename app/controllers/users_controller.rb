class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
		@user = User.new(name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])

    if @user && @user.password == @user.password_confirmation
      @user.save
      flash[:success] = "You have successfully signed up and logged in"
      session[:user_id] = @user.id
      welcome
		else
      flash[:error] = "You must signup before logging in"
      redirect_to '/users/new'
    end
  end

  private

  def welcome
    if @user
      render :welcome
    else
      redirect_to login_path
    end
  end
end
