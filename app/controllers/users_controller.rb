class UsersController < ApplicationController

  def new
    User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_user_in
      redirect_to show_path
    else
      redirect_to signup_path
    end
  end

  def show
    if !logged_in?
      redirect_to login_path
    end
    @user = User.find(session[:user_id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
