class UsersController < ApplicationController

  def new
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

  def show
    @user = find_by_id
  end

  private

  def find_by_id
    User.find_by_id(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
