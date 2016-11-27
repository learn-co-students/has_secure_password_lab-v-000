class UsersController < ApplicationController

  #/users/new
  def new
  end

  # POST to create new users /users 
  def create
    if !params[:user][:password].nil?  && params[:user][:password] == params[:user][:password_confirmation]
      user = User.create(user_params)
      session[:user_id] = user.id
      redirect_to session_path(user)
    else
      redirect_to new_user_path
    end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
