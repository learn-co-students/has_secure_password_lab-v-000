class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to welcome_path
    else
      redirect_to signup_path
    end
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
