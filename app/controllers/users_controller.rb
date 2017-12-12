class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path(@user)
    else
      flash[:notice] = "Password and confirmation don't match"
      redirect_to new_path
    end
  end

  def welcome
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
