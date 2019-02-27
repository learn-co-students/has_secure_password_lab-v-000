class UsersController < ApplicationController
  def create
    if user_params[:password] == user_params[:password_confirmation]
     @user = User.create(user_params)
     session[:user_id] = @user.id
    else
      redirect_to users_new_path
    end
  end

 private

 def user_params
   params.require(:user).permit(:name, :password, :password_confirmation)
 end
end
