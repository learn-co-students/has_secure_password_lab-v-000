class UsersController < ApplicationController

  def new
  end


  def create
    return redirect_to signup_path if params[:user][:password] != params[:user][:password_confirmation]
     if @user = User.create(user_params)
       session[:user_id] = @user.id
       redirect_to root_path
     else
       redirect_to login_path
     end
  end

   private

   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end


end
