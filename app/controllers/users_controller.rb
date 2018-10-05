class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to 'login_path'
    else
      redirect_to (users_new_path)

    end
  end

  def welcome

    render "welcome"
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
