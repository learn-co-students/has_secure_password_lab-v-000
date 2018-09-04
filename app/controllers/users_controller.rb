class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:user][:name].nil? || params[:user][:name].empty?
      flash[:message] = "Needs Name"
      redirect_to signup_path
    elsif params[:user][:password].nil? || params[:user][:password].empty?
      flash[:message] = "Needs Password"
      redirect_to signup_path
    elsif params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to homepage_path
    else
      flash[:message] = "Needs same passwords"
      redirect_to signup_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
