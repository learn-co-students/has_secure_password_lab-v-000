class UsersController < ApplicationController

  def home
    @user = user.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to home_path
   else
     flash[:alert] = "Passwords need to match"
     redirect_to signup_path
   end
  end

  def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end
end
