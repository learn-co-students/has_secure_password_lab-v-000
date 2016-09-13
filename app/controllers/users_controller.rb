class UsersController < ApplicationController

  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_welcome_path
    else
      redirect_to users_new_path
    end
  end

  def destroy
    session.delete :user_id
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
