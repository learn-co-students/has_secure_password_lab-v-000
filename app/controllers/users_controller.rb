class UsersController < ApplicationController
  #before_action :require_logged_in

  def new
    @user = User.new
  end

  def home
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
  else
    redirect_to signup_path
  end
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
