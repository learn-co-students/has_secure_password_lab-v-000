class UsersController < ApplicationController
  def new
    @user = User.find(params[:id])
  end

  def create
     user = User.create(user_params) # we create a user
     if user.save #if user is saved, then we assign it to the session, that is log in.
       session[:user_id] = user.id
       redirect_to root_path
     else
       redirect_to new_user_path # else we take the visitor to the login page again.
     end

  end

   private

   def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end
end
