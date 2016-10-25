class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to create_path
    else
      redirect_to new_path
    end
  end

  def show
  end

  private

  def user_params
   params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
