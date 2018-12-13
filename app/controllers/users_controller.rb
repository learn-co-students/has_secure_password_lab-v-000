class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      flash[:notice] = 'Passwords do not match. Please try again.'
      redirect_to signup_path
    end
  end

  def welcome

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
