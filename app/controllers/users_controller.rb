class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to signup_path, notice: "Username invalid."
    end
  end

  def index
    if !logged_in?
      redirect_to login_path, alert: "You need to be logged in."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
