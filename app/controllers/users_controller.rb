class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      login!
      redirect_to users_path
    else
      flash[:notice] = "User or Password invalid. Please try again."
      redirect_to new_user_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
