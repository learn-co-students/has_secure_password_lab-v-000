class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render :show
    else
      redirect_to new_user_path
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
