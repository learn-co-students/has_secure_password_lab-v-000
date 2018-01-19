class UsersController < ApplicationController
  before_action :require_login, only: [:home]

  def new
    if logged_in?
      redirect_to users_home_path
    else
      @user = User.new
    end
  end

  def create
    if logged_in?
      redirect_to users_home_path
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to users_home_path
      else
        redirect_to users_signup_path
      end
    end
  end

  def home
    @user = current_user
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
