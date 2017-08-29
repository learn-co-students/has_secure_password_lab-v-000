class UsersController < ApplicationController
  before_action :require_login, only: [:index]

  def index
    @user = User.find_by(id: current_user)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to signup_path, notice: user.errors.full_messages.join("\r\n")
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
