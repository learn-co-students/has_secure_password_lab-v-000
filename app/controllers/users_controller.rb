class UsersController < ApplicationController

  def homepage
    @user = User.find(session[:user_id])
  end

  def new
  end

  def create
    if password_match
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  private

  def password_match
    params[:user][:password].present? && params[:user][:password_confirmation].present? &&
      params[:user][:password] == params[:user][:password_confirmation]
  end
end
