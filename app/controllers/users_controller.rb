class UsersController < ApplicationController

  def homepage
  end

  def new

  end

  def create
   @user = User.create(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to "users/#{@user.id}"
  else
    redirect_to "/users"
  end
 end

 private

 def user_params
   params.require(:user).permit(:name, :password, :password_confirmation)
 end
end
