class UsersController < ApplicationController

  def homepage
  end

  def new
  end

  def create
    User.create(user_params)
  end

  def user_params
   params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
