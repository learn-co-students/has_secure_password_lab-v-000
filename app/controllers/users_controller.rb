class UsersController < ApplicationController

 def new
   @user = User.new
 end

 def create
   @user = User.new(new_params)
   if !@user.save
     redirect_to controller: 'users', action: 'new'
   else
   session[:user_id] = @user.id
   redirect_to user_path(@user)
    end
 end

 def show
 end

 private

 def new_params
   params.require(:user).permit(:name, :password, :password_confirmation)
 end
end
