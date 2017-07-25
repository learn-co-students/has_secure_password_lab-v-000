class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
    if !logged_in?
      redirect_to '/login'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def current_user
    user = User.find_by_id(session[:user_id])
  end
end
