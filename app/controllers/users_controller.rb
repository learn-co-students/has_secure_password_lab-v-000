class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to signup_path
    end
  end

  def home
    if session[:user_id] != nil
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
