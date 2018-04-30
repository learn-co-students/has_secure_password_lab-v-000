class UsersController < ApplicationController
  
  def index
    redirect_to signup_path unless logged_in?
  end
  
  def new
    redirect_to home_path if logged_in?
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      return redirect_to home_path
    else
      redirect_to signup_path
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
