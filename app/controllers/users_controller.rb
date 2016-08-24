class UsersController < ApplicationController
   def login
   end

   def create
     user = User.new(user_params)
     if user.save
       @user = User.find_by(email: user.email)
       session[:user_id] = @user.id
       redirect_to controller: 'application', action: 'hello' 
     else
       redirect_to :signup
     end
   end

   private

   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end


end
