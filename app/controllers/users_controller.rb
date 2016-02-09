class UsersController < ApplicationController
  def new
    redirect_to home_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to signup_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name,:password,:password_confirmation)
    end

    def current_user
      session[:user_id]
    end

    def logged_in?
      !!current_user
    end
end
