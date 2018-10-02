class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      login(@user)
      redirect_to user_path(@user.id)
    else
      redirect_to new_user_path
    end
  end
  
  def show
    @user = current_user
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end