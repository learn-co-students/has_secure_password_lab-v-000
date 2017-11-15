class UsersController < ApplicationController
   def create
    #binding.pry
  

    user = User.new(user_params)
     if user.nil? || params[:user][:password] != params[:user][:password_confirmation]
       redirect_to new_user_path
     else
       user.save
       session[:user_id] = user.id
     end
   end




   private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end


end
