class SessionsController < ApplicationController
 
 def login
 end
 
 def create
  @user = User.find_by(:name => params[:user][:name])
   if @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    redirect_to home_path
   else
    flash[:message] = "Incorrect login credentials, please try again"
    redirect_to login_path
   end
  end
 
 def destroy
  current_user.delete :user_id
  redirect_to login_path
 end
 
end