class UsersController < ApplicationController

  def welcome
  end

  def new
    @user = User.new
  end

  def create
    redirect_to signup_path unless params[:user][:password] == params[:user][:password_confirmation]
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
