class UsersController < ApplicationController
  
  

  def create 
    if session[:user_id].empty? || session[:user_id].nil?
      redirect 
    else 
      @user = User.new(name: params[:name], password: params[:password])
    end
  end
  
  
  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
  
  
end
