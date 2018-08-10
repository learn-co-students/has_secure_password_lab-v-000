class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    @user.save
    
    render 'show'
  end

  def show
    if logged_in?
      render 'show'
    else
      redirect_to login_path
    end
  end
end
