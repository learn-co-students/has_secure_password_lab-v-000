class UsersController < ApplicationController
  before_action :require_logged_in, only: [:welcome]
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "user created Successfully"
      redirect_to welcome_path
    else
      flash[:notice] = "New User not created, try again"
      redirect_to new_user_path
    end
  end


  def welcome
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
