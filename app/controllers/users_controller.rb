class UsersController < ApplicationController

  def new
  end

  def create
    user = User.create(user_params)
    if user.errors.any?
      redirect_to action: 'new'
    else
      session[:user_id] = user.id
      redirect_to '/home'
    end
  end

  def home
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end