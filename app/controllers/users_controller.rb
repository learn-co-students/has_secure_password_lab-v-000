class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    redirect_to new_user_path unless params[:user][:password] == params[:user][:password_confirmation]
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    end
  end

  def show
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
