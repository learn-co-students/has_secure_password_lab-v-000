class UsersController < ApplicationController
  before_action :require_login, only: [:welcome]

  def new
    if session[:user_id].present?
      redirect_to welcome_path
    else
      @user = User.new
      render :signup
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to signup_path
    end
  end

  def welcome
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
