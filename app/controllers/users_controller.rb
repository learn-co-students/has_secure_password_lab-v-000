class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    @user.save

    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to '/users/new'
    else
      session[:user_id] = @user.id
      redirect_to '/'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
