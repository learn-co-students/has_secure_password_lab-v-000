class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
   @user = User.find_by(name: params[:user][:name])
   if @user
     if @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to welcome_path
     else
       flash[:alert] = "Incorrect password"
       redirect_to login_path
     end
   else
     flash[:alert] = "User name not found in our records"
     redirect_to login_path
   end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

end
