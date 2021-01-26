class UsersController < ApplicationController
  before_action :check_login, only: [:home]
  def home

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(home_path)
    else
      redirect_to(new_user_path)
      # render "new", alert: "Hmmmm that wasn't supposed to happen..."
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
