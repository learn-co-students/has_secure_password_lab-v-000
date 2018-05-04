class UsersController < ApplicationController

 def new
  if current_user
   @user = current_user
   redirect_to home_path
  else
   @user = User.new
  end
 end
 
 def create
  @user = User.new(user_params)
  if @user.save
   session[:user_id] = User.last.id
   @user = current_user
   redirect_to home_path
  else
   redirect_to new_user_path
  end
 end
 
 private
 
 def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
 end
end
