class UsersController < ApplicationController

#responds to the sign up form
  def new

  end


  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
    redirect_to signup_path
    end

  end


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
