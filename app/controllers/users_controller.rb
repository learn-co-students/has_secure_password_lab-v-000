class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    redirect_to user_path(current_user) if logged_in
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to users_new_path
    end
  end

  def show
    
  end

  private
  def require_login
    redirect_to sessions_new_path, alert: "You must be logged in to perform this action" unless logged_in
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
